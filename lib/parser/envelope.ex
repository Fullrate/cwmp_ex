defmodule CWMP.Protocol.Parser.Envelope do
  use CWMP.Protocol.ParserHelpers

  defmodule Header do
    use Elixir.CWMP.Protocol.ParserHelpers
    alias CWMP.Protocol.Messages.Header

    def initial_acc do
      %Header{}
    end

    @known_header_fields ['ID', 'HoldRequests', 'SessionTimeout', 'NoMoreRequests']
    def start_element(state, [field], attribs) do
      mustUnderstand = not((for {:attribute, 'mustUnderstand', _, _, '1'} <- attribs, do: true) |> Enum.empty?)
      if mustUnderstand && !Enum.member?(@known_header_fields, field) do
        raise "Field '#{field}' must be understood, but we don't"
      end
      state
    end

    def end_element(state, ['ID']) do
      update_acc(state, fn cur -> %Header{cur | id: state.last_text} end)
    end

    def end_element(state, ['SessionTimeout']) do
      case Integer.parse(state.last_text) do
        {val, ""} when val > 0 -> update_acc(state, fn cur -> %Header{cur | session_timeout: val} end)
        _ -> raise "Session timeout is invalid"
      end
    end

    def end_element(state, ['HoldRequests']) do
      val = case state.last_text do
        "0" -> false
        "1" -> true
        _ -> raise "Invalid value '#{state.last_text}' for hold_requests"
      end
      update_acc(state, fn cur -> %Header{cur | hold_requests: val} end)
    end

    def end_element(state, ['NoMoreRequests']) do
      val = case state.last_text do
        "0" -> false
        "1" -> true
        _ -> raise "Invalid value '#{state.last_text}' for no_more_requests"
      end
      update_acc(state, fn cur -> %Header{cur | no_more_requests: val} end)
    end
  end

  def initial_acc do
    %{header: nil,
      entries: []}
  end

  def start_element(state, ['Header', 'Envelope'], _attribs) do
    push_handler(state, Header)
  end

  @message_types %{
     'Fault' => CWMP.Protocol.Parser.Messages.Fault,
     'Inform' => CWMP.Protocol.Parser.Messages.Inform,
     'InformResponse' => CWMP.Protocol.Parser.Messages.InformResponse,
     'TransferComplete' => CWMP.Protocol.Parser.Messages.TransferComplete,
     'TransferCompleteResponse' => CWMP.Protocol.Parser.Messages.TransferCompleteResponse,
     'AutonomousTransferComplete' => CWMP.Protocol.Parser.Messages.AutonomousTransferComplete,
     'AutonomousTransferCompleteResponse' => CWMP.Protocol.Parser.Messages.AutonomousTransferCompleteResponse,
     'GetRPCMethodsResponse' => CWMP.Protocol.Parser.Messages.GetRPCMethodsResponse,
     'GetRPCMethods' => CWMP.Protocol.Parser.Messages.GetRPCMethods,
     'GetParameterValues' => CWMP.Protocol.Parser.Messages.GetParameterValues,
     'GetParameterValuesResponse' => CWMP.Protocol.Parser.Messages.GetParameterValuesResponse,
     'GetParameterNames' => CWMP.Protocol.Parser.Messages.GetParameterNames,
     'GetParameterNamesResponse' => CWMP.Protocol.Parser.Messages.GetParameterNamesResponse,
     'SetParameterValues' => CWMP.Protocol.Parser.Messages.SetParameterValues,
     'SetParameterValuesResponse' => CWMP.Protocol.Parser.Messages.SetParameterValuesResponse,
     'SetParameterAttributesResponse' => CWMP.Protocol.Parser.Messages.SetParameterAttributesResponse,
     'GetParameterAttributes' => CWMP.Protocol.Parser.Messages.GetParameterAttributes,
     'GetParameterAttributesResponse' => CWMP.Protocol.Parser.Messages.GetParameterAttributesResponse,
     'SetParameterAttributes' => CWMP.Protocol.Parser.Messages.SetParameterAttributes,
     'AddObject' => CWMP.Protocol.Parser.Messages.AddObject,
     'AddObjectResponse' => CWMP.Protocol.Parser.Messages.AddObjectResponse,
     'DeleteObject' => CWMP.Protocol.Parser.Messages.DeleteObject,
     'DeleteObjectResponse' => CWMP.Protocol.Parser.Messages.DeleteObjectResponse,
     'Download' => CWMP.Protocol.Parser.Messages.Download,
     'DownloadResponse' => CWMP.Protocol.Parser.Messages.DownloadResponse,
     'Reboot' => CWMP.Protocol.Parser.Messages.Reboot,
     'RebootResponse' => CWMP.Protocol.Parser.Messages.RebootResponse,
     'GetQueuedTransfers' => CWMP.Protocol.Parser.Messages.GetQueuedTransfers,
     'GetQueuedTransfersResponse' => CWMP.Protocol.Parser.Messages.GetQueuedTransfersResponse,
     'ScheduleInform' => CWMP.Protocol.Parser.Messages.ScheduleInform,
     'ScheduleInformResponse' => CWMP.Protocol.Parser.Messages.ScheduleInformResponse
  }

  def start_element(state, [msgtype, 'Body', 'Envelope'], _attribs) do
    case Map.get(@message_types, msgtype) do
      nil -> raise "Message type '#{msgtype}' is not known"
      handler -> push_handler(state, handler)
    end
  end

  def end_element(state, ['Header', 'Envelope']) do
    update_acc(state, fn cur -> %{cur | header: state.last_acc} end)
  end

  def end_element(state, [_, 'Body', 'Envelope']) do
    update_acc(state, fn cur -> %{cur | entries: cur.entries ++ [state.last_acc]} end)
  end
end


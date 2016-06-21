defmodule CWMP.Protocol.Parser.Envelope do
  use CWMP.Protocol.ParserHelpers

  defmodule Header do
    use Elixir.CWMP.Protocol.ParserHelpers
    alias CWMP.Protocol.Messages.Header

    def initial_acc do
      %Header{}
    end

    @known_header_fields ['ID', 'HoldRequests', 'SessionTimeout', 'NoMoreRequests']
    def start_element(state, [field], attribs, _uri) do
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
      update_acc(state, fn cur -> %Header{cur | session_timeout: integerValue(state.last_text, fn(x) -> x > 0 end)} end)
    end

    def end_element(state, ['HoldRequests']) do
      update_acc(state, fn cur -> %Header{cur | hold_requests: integerValue(state.last_text, fn(x) -> x in 0..1 end)} end)
    end

    def end_element(state, ['NoMoreRequests']) do
      update_acc(state, fn cur -> %Header{cur | no_more_requests: boolValue(state.last_text)} end)
    end
  end

  def initial_acc do
    %{cwmp_version: nil,
      header: nil,
      entries: []}
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
     'ScheduleInformResponse' => CWMP.Protocol.Parser.Messages.ScheduleInformResponse,
     'SetVouchers' => CWMP.Protocol.Parser.Messages.SetVouchers,
     'SetVouchersResponse' => CWMP.Protocol.Parser.Messages.SetVouchersResponse,
     'GetOptions' => CWMP.Protocol.Parser.Messages.GetOptions,
     'GetOptionsResponse' => CWMP.Protocol.Parser.Messages.GetOptionsResponse,
     'Upload' => CWMP.Protocol.Parser.Messages.Upload,
     'UploadResponse' => CWMP.Protocol.Parser.Messages.UploadResponse,
     'FactoryReset' => CWMP.Protocol.Parser.Messages.FactoryReset,
     'FactoryResetResponse' => CWMP.Protocol.Parser.Messages.FactoryResetResponse,
     'GetAllQueuedTransfers' => CWMP.Protocol.Parser.Messages.GetAllQueuedTransfers,
     'GetAllQueuedTransfersResponse' => CWMP.Protocol.Parser.Messages.GetAllQueuedTransfersResponse,
     'ScheduleDownload' => CWMP.Protocol.Parser.Messages.ScheduleDownload,
     'ScheduleDownloadResponse' => CWMP.Protocol.Parser.Messages.ScheduleDownloadResponse,
     'CancelTransfer' => CWMP.Protocol.Parser.Messages.CancelTransfer,
     'CancelTransferResponse' => CWMP.Protocol.Parser.Messages.CancelTransferResponse,
     'ChangeDUState' => CWMP.Protocol.Parser.Messages.ChangeDUState,
     'ChangeDUStateResponse' => CWMP.Protocol.Parser.Messages.ChangeDUStateResponse,
     'Kicked' => CWMP.Protocol.Parser.Messages.Kicked,
     'KickedResponse' => CWMP.Protocol.Parser.Messages.KickedResponse,
     'RequestDownload' => CWMP.Protocol.Parser.Messages.RequestDownload,
     'RequestDownloadResponse' => CWMP.Protocol.Parser.Messages.RequestDownloadResponse,
     'DUStateChangeComplete' => CWMP.Protocol.Parser.Messages.DUStateChangeComplete,
     'DUStateChangeCompleteResponse' => CWMP.Protocol.Parser.Messages.DUStateChangeCompleteResponse,
     'AutonomousDUStateChangeComplete' => CWMP.Protocol.Parser.Messages.AutonomousDUStateChangeComplete,
     'AutonomousDUStateChangeCompleteResponse' => CWMP.Protocol.Parser.Messages.AutonomousDUStateChangeCompleteResponse
  }

  def start_element(state, ['Header', 'Envelope'], _attribs, _uri) do
    push_handler(state, Header)
  end

  def start_element(state, [msgtype, 'Body', 'Envelope'], _attribs, uri) do
    case Map.get(@message_types, msgtype) do
      nil -> raise "Message type '#{msgtype}' is not known"
      handler -> update_acc(state, fn cur -> %{cur | cwmp_version: uri} end) |> push_handler(handler)
    end
  end

  def end_element(state, ['Header', 'Envelope']) do
    update_acc(state, fn cur -> %{cur | header: state.last_acc} end)
  end

  def end_element(state, [_, 'Body', 'Envelope']) do
    update_acc(state, fn cur -> %{cur | entries: cur.entries ++ [state.last_acc]} end)
  end
end


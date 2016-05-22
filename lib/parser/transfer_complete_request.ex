defmodule CWMP.Protocol.Parser.Messages.TransferCompleteRequest do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.TransferCompleteRequest

  def initial_acc do
    %TransferCompleteRequest{}
  end

  def start_element(state, ['FaultStruct'], _attribs) do
    push_handler(state, FaultStruct)
  end

  def end_element(state, ['FaultStruct']) do
    update_acc(state, fn acc -> %TransferCompleteRequest{acc | fault_struct: state.last_acc} end)
  end


  @accepted_time_formats ["{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}",
                          "{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}{Z:}",
                          "{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}Z"]
  def end_element(state, ['StartTime']) do
    times = @accepted_time_formats
    |> Enum.map(&Timex.DateFormat.parse(state.last_text, &1))
    |> Enum.filter(fn
      {:ok, _} -> true
      _ -> false
    end)
    case times do
      [{:ok, val} | _] -> update_acc(state, fn cur -> %TransferCompleteRequest{cur | start_time: val} end)
      _ -> raise "StartTime '#{state.last_text}' has unacceptable format"
    end
  end

  def end_element(state, ['CompleteTime']) do
    times = @accepted_time_formats
    |> Enum.map(&Timex.DateFormat.parse(state.last_text, &1))
    |> Enum.filter(fn
      {:ok, _} -> true
      _ -> false
    end)
    case times do
      [{:ok, val} | _] -> update_acc(state, fn cur -> %TransferCompleteRequest{cur | complete_time: val} end)
      _ -> raise "CompleteTime '#{state.last_text}' has unacceptable format"
    end
  end

  def end_element(state, ['CommandKey']) do
    update_acc(state, fn cur -> %TransferCompleteRequest{cur | command_key: state.last_text} end)
  end
end


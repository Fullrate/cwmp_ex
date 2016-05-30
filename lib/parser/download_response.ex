defmodule CWMP.Protocol.Parser.Messages.DownloadResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.DownloadResponse

  def initial_acc do
    %DownloadResponse{}
  end

  def end_element(state, ['Status']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val in 0..1  -> update_acc(state, fn cur -> %DownloadResponse{cur | status: val} end)
      _ -> raise "Invalid status value"
    end
  end

  @accepted_time_formats ["{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}",
                          "{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}{Z:}",
                          "{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}Z"]
  def end_element(state, ['StartTime']) do
    times = @accepted_time_formats
    |> Enum.map(&Timex.Parse.DateTime.Parser.parse(state.last_text, &1))
    |> Enum.filter(fn
      {:ok, _} -> true
      _ -> false
    end)
    case times do
      [{:ok, val} | _] -> update_acc(state, fn cur -> %DownloadResponse{cur | start_time: val} end)
      _ -> raise "StartTime '#{state.last_text}' has unacceptable format"
    end
  end

  def end_element(state, ['CompleteTime']) do
    times = @accepted_time_formats
    |> Enum.map(&Timex.Parse.DateTime.Parser.parse(state.last_text, &1))
    |> Enum.filter(fn
      {:ok, _} -> true
      _ -> false
    end)
    case times do
      [{:ok, val} | _] -> update_acc(state, fn cur -> %DownloadResponse{cur | complete_time: val} end)
      _ -> raise "CompleteTime '#{state.last_text}' has unacceptable format"
    end
  end

end


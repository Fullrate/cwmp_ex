defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.ScheduleDownload do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    Enum.map([:filetype, :url, :filesize], fn(f) ->
      case Map.fetch(req, f) do
        {:ok,x} -> if x == nil do
          raise "key #{f} can not be nil"
        end
        {:error} -> raise "key #{f} must be set"
      end
    end)
    if not hd(to_charlist(req.filetype)) in [49,50,51,52,53,88] do
      raise "Invalid filetype"
    end
    filesize=integerValue(req.filesize, fn(x) -> x>=0 end)
    tw_list=generateTimeWindowList( req.timewindowlist )
    element("cwmp:ScheduleDownload", [
      element(:CommandKey, req.commandkey),
      element(:FileType, req.filetype),
      element(:URL, req.url),
      element(:Username, req.username),
      element(:Password, req.password),
      element(:FileSize, filesize),
      element(:TargetFileName, req.target_filename),
      element(:TimeWindowList, %{"SOAP-ENC:arrayType": "cwmp:TimeWindowStruct[#{length(tw_list)}]"}, tw_list)
    ])
  end

  defp generateTimeWindowList( timewindowlist ) do
    for tws <- timewindowlist, do: element(:TimeWindowStruct, [
      element(:WindowStart, integerValue( tws.window_start, fn(x) -> x > 0 end)),
      element(:WindowEnd, integerValue( tws.window_end, fn(x) -> x > 0 end)),
      element(:WindowMode, tws.window_mode),
      element(:UserMessage, tws.user_message),
      element(:MaxRetries, integerValue(tws.max_retries)) ])
  end

end

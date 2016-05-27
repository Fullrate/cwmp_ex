defmodule CWMP.Protocol.Generator.Messages.DownloadResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    status=integerValue(req.status, fn(x) -> x in 0..1 end)
    stime=timeString(req.start_time)
    ctime=timeString(req.complete_time)
    element('cwmp:DownloadResponse', [
      element('Status',status),
      element('StartTime',stime),
      element('CompleteTime',ctime)])
  end
end

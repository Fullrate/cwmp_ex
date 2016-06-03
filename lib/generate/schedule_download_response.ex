defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.ScheduleDownloadResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:ScheduleDownloadResponse", nil)
  end
end

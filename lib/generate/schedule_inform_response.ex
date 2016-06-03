defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.ScheduleInformResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:ScheduleInformResponse", nil)
  end
end


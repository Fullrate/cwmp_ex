defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.ScheduleInform do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    ds=integerValue(req.delay_seconds, fn(x) -> x >= 0 end)
    element("cwmp:ScheduleInform", [
      element(:DelaySeconds,ds),
      element(:CommandKey,req.commandkey)
    ])
  end
end


defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.AutonomousDUStateChangeCompleteResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:AutonomousDUStateChangeCompleteResponse", nil)
  end
end

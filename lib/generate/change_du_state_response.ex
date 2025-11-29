defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.ChangeDUStateResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:ChangeDUStateResponse", nil)
  end
end

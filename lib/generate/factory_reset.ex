defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.FactoryReset do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:FactoryReset", nil)
  end
end

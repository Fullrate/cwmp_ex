defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.FactoryResetResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:FactoryResetResponse", nil)
  end
end

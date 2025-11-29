defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.RebootResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:RebootResponse", nil)
  end
end

defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.SetParameterAttributesResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:SetParameterAttributesResponse", nil)
  end

end


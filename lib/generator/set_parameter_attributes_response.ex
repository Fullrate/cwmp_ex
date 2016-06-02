defmodule CWMP.Protocol.Generator.Messages.SetParameterAttributesResponse do
  import XmlBuilder

  def generate() do
    element("cwmp:SetParameterAttributesResponse", nil)
  end

end


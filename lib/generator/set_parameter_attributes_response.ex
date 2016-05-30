defmodule CWMP.Protocol.Generator.Messages.SetParameterAttributesResponse do
  import XmlBuilder

  def generate() do
    element('cwmp:SetParameterAttributesResponse', '')
  end

end


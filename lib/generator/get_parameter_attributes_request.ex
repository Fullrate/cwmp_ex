defmodule CWMP.Protocol.Generator.Messages.GetParameterAttributesRequest do
  import XmlBuilder

  def generate(req) do
    params=for p <- req.parameters, do: element(:string, p)
    element('cwmp:GetParameterAttributes', [element(:ParameterNames,[params])])
  end
end


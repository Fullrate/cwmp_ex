defmodule CWMP.Protocol.Generator.Messages.GetParameterAttributesResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    params=for p <- req.parameters, do: parameterAttributeStruct(p)
    element("cwmp:GetParameterAttributesResponse", [element(:ParameterList, %{"SOAP-ENC:arrayType": "cwmp:ParameterAttributeStruct[#{length(params)}]"}, [params])])
  end

  defp parameterAttributeStruct(pas) do
    elements=for p <- pas.accesslist, do: element(:string, p)
    notification=integerValue(pas.notification, fn(x) -> x in 0..6 end)
    element(:ParameterAttributeStruct, [
      element(:Name, pas.name),
      element(:Notification, notification),
      element(:AccessList,elements) ])
  end

end


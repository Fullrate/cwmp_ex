defmodule CWMP.Protocol.Generator.Messages.GetParameterValuesResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    params=for p <- req.parameters, do: element(:ParameterValueStruct, [element(:Name,p.name), element(:Value, %{"xsi:type": p.type}, p.value)])
    element("cwmp:GetParameterValuesResponse", [
      element(:ParameterList, %{"SOAP-ENC:arrayType": "cwmp:ParameterValueStruct[#{length(params)}]"}, params)] )
  end
end


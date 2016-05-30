defmodule CWMP.Protocol.Generator.Messages.SetParameterValuesResponse do
  import XmlBuilder

  def generate(req) do
    params=for p <- req.parameters, do: parameterValueStruct(p)
    element('cwmp:SetParameterValues', [element(:ParameterList, %{'SOAP-ENC:arrayType': 'cwmp:ParameterValueStruct[#{length(params)}]'}, params), element(:ParameterKey,req.parameter_key)])
  end

  defp parameterValueStruct( param ) do
    element(:ParameterValueStruct, [
      element(:Name, param.name),
      element(:Value, %{'xsi:type': param.type}, param.value)])
  end
end


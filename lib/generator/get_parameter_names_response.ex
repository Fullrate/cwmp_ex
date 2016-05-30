defmodule CWMP.Protocol.Generator.Messages.GetParameterNamesResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    params=for p <- req.parameters, do: element(:ParameterInfoStruct, [element(:Name,p.name), element(:Writable, boolValue(p.writable))])
    element('cwmp:GetParameterNamesResponse', [
      element(:ParameterList, %{"SOAP-ENC:arrayType": "cwmp:ParameterInfoStruct[#{length(params)}]"}, params)] )
  end
end


defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.GetParameterAttributes do
  import XmlBuilder

  def generate(req) do
    params=for p <- req.parameters, do: element(:string, p)
    element("cwmp:GetParameterAttributes", [element(:ParameterNames, %{"soapenc:arrayType" => "xsd:string[#{length(params)}]"},  [params])])
  end
end


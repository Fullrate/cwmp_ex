defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.GetParameterValues do
  import XmlBuilder

  def generate(req) do
    params=for p <- req.parameters, do: element(p.type, p.name)
    element("cwmp:GetParameterValues", [element(:ParameterNames,  %{"soapenc:arrayType" => "xsd:string[#{length(params)}]"},params)])
  end
end


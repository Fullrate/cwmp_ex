defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.GetRPCMethodsResponse do
  import XmlBuilder

  def generate(req) do
    mlist=for m <- req.methods, do: element(:string, m)
    element("cwmp:GetRPCMethodsResponse", [
	  element(:MethodList, %{"SOAP-ENC:arrayType": "xsd:string[#{length(mlist)}]"}, mlist)])
  end
end

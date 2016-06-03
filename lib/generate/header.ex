defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.Header do
  import XmlBuilder

  def generate(req) do
    element("cwmp:ID", %{"SOAP-ENV:mustUnderstand": 1}, req.id)
  end
end


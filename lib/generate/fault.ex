defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.Fault do
  import XmlBuilder

  def generate(req) do
    element("SOAP-ENV:Fault", [
      element(:faultcode, req.faultcode),
      element(:faultstring, req.faultstring),
      element(:detail, [
        element("cwmp:Fault",[
          element(:FaultCode, req.detail.code),
          element(:FaultString, req.detail.string)
        ])
      ])
    ])
  end
end

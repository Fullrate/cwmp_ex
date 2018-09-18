defmodule CWMP.Protocol.Parser.FaultTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
          <SOAP-ENV:Fault>
           <faultcode>SOAP-ENV:Client</faultcode>
           <faultstring>CWMP fault</faultstring>
           <detail>
            <cwmp:Fault>
             <FaultCode>9005</FaultCode>
             <FaultString>Invalid parameter name</FaultString>
            </cwmp:Fault>
           </detail>
          </SOAP-ENV:Fault>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample_result {:ok,%{cwmp_version: nil, entries: [%CWMP.Protocol.Messages.Fault{
                      detail: %CWMP.Protocol.Messages.FaultStruct{code: 9005, string: "Invalid parameter name"}, 
                      faultcode: "SOAP-ENV:Client",
                      faultstring: "CWMP fault"}],
               header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50", no_more_requests: false, session_timeout: 30}}}

  test "parses fault request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

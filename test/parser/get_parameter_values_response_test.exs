defmodule CWMP.Protocol.Parser.GetParameterValuesResponseTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:GetParameterValuesResponse>
                        <ParameterList xsi:type="SOAP-ENC:Array" SOAP-ENC:arrayType="cwmp:ParameterValueStruct[64]">
                                <ParameterValueStruct>
                                        <Name>Device.IP.Interface.3.IPv4AddressNumberOfEntries</Name>
                                        <Value xsi:type="xsd:unsignedInt">1</Value>
                                </ParameterValueStruct>
                                <ParameterValueStruct>
                                        <Name>Device.IP.Interface.3.IPv6AddressNumberOfEntries</Name>
                                        <Value xsi:type="xsd:unsignedInt">1</Value>
                                </ParameterValueStruct>
                        </ParameterList>
                </cwmp:GetParameterValuesResponse>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.GetParameterValuesResponse{
        parameters: [%CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.IP.Interface.3.IPv4AddressNumberOfEntries",
            type: "xsd:unsignedInt",
            value: "1"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.IP.Interface.3.IPv6AddressNumberOfEntries",
            type: "xsd:unsignedInt", value: "1"}]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50",
      session_timeout: 30, no_more_requests: false}}}

  test "parses get parameter values response request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

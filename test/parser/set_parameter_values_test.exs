defmodule CWMP.Protocol.Parser.SetParameterValuesTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:SetParameterValues>
                  <ParameterList SOAP-ENC:arrayType="cwmp:ParameterValueStuct[2]">
                    <ParameterValueStruct>
                      <Name>Device.Test</Name>
                      <Value xsd:type="xsi:string">Foo</Value>
                    </ParameterValueStruct>
                    <ParameterValueStruct>
                      <Name>Device.Test.Whatever</Name>
                      <Value xsd:type="xsi:int">1</Value>
                    </ParameterValueStruct>
                  </ParameterList>
                </cwmp:SetParameterValues>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.SetParameterValues{
        parameters: [
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.Test", type: "xsi:string", value: "Foo"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.Test.Whatever", type: "xsi:int", value: "1"}
        ],
        parameter_key: ""
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50",
      session_timeout: 30, no_more_requests: false}}}

  test "parses SetParameterValues request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

  @sample2 """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:SetParameterValues>
                  <ParameterList SOAP-ENC:arrayType="cwmp:ParameterValueStuct[2]">
                    <ParameterValueStruct>
                      <Name>Device.Test</Name>
                      <Value xsd:type="xsi:string">Foo</Value>
                    </ParameterValueStruct>
                    <ParameterValueStruct>
                      <Name>Device.Test.Whatever</Name>
                      <Value xsd:type="xsi:int">1</Value>
                    </ParameterValueStruct>
                  </ParameterList>
                  <ParameterKey>foo</ParameterKey>
                </cwmp:SetParameterValues>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample2_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.SetParameterValues{
        parameters: [
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.Test", type: "xsi:string", value: "Foo"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.Test.Whatever", type: "xsi:int", value: "1"}
        ],
        parameter_key: "foo"
      }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50",
      session_timeout: 30, no_more_requests: false}}}

  test "parses 2nd SetParameterValues request" do
    assert(CWMP.Protocol.Parser.parse(@sample2) == @sample2_result)
  end
end

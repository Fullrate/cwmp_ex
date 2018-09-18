defmodule CWMP.Protocol.Generator.InformTest do
  use ExUnit.Case, async: true
  import TestHelpers

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">100</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:Inform>
      <DeviceId>
        <Manufacturer>ZyXEL</Manufacturer>
        <OUI>EC43F6</OUI>
        <ProductClass>P-2601HN-F1</ProductClass>
        <SerialNumber>EC43F69AF408</SerialNumber>
      </DeviceId>
      <Event SOAP-ENC:arrayType="cwmp:EventStruct[1]">
        <EventStruct>
          <EventCode>2 PERIODIC</EventCode>
          <CommandKey></CommandKey>
        </EventStruct>
      </Event>
      <MaxEnvelopes>1</MaxEnvelopes>
      <CurrentTime>2015-01-19T23:08:24Z</CurrentTime>
      <RetryCount>0</RetryCount>
      <ParameterList SOAP-ENC:arrayType="cwmp:ParameterValueStruct[8]">
        <ParameterValueStruct>
          <Name>InternetGatewayDevice.DeviceSummary</Name>
          <Value xsi:type="xsd:string">InternetGatewayDevice:1.4[](Baseline:1, EthernetLAN:1, WiFiLAN:1, EthernetWAN:1, ADSLWAN:1, IPPing:1, DSLDiagnostics:1, Time:1), VoiceService:1.0[1](Endpoint:1, SIPEndpoint:1)</Value>
        </ParameterValueStruct>
        <ParameterValueStruct>
          <Name>InternetGatewayDevice.DeviceInfo.SpecVersion</Name>
          <Value xsi:type="xsd:string">1.0</Value>
        </ParameterValueStruct>
        <ParameterValueStruct>
          <Name>InternetGatewayDevice.DeviceInfo.HardwareVersion</Name>
          <Value xsi:type="xsd:string">P-2601HN-F1</Value>
        </ParameterValueStruct>
        <ParameterValueStruct>
          <Name>InternetGatewayDevice.DeviceInfo.SoftwareVersion</Name>
          <Value xsi:type="xsd:string">V1.00(AACB.3)</Value>
        </ParameterValueStruct>
        <ParameterValueStruct>
          <Name>InternetGatewayDevice.DeviceInfo.ProvisioningCode</Name>
          <Value xsi:type="xsd:string"></Value>
        </ParameterValueStruct>
        <ParameterValueStruct>
          <Name>InternetGatewayDevice.ManagementServer.ConnectionRequestURL</Name>
          <Value xsi:type="xsd:string">http://2.110.157.83:7676/CWMP/ConnectionRequest</Value>
        </ParameterValueStruct>
        <ParameterValueStruct>
          <Name>InternetGatewayDevice.ManagementServer.ParameterKey</Name>
          <Value xsi:type="xsd:string"></Value>
        </ParameterValueStruct>
        <ParameterValueStruct>
          <Name>InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection.1.ExternalIPAddress</Name>
          <Value xsi:type="xsd:string">2.110.157.83</Value>
        </ParameterValueStruct>
      </ParameterList>
    </cwmp:Inform>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates inform request" do
    assert(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "100"},
      %CWMP.Protocol.Messages.Inform{
        device_id: %CWMP.Protocol.Messages.DeviceIdStruct{
            manufacturer:   "ZyXEL",
            oui:            "EC43F6",
            product_class:  "P-2601HN-F1",
            serial_number:  "EC43F69AF408"
        },
        events: [%CWMP.Protocol.Messages.EventStruct{code: "2 PERIODIC",
            command_key: ""}],
        max_envelopes: 1,
        retry_count: 0,
        current_time: generate_datetime({{19,1,2015},{23,8,24}}),
        parameters: [%CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceSummary",
            type: "xsd:string",
            value: "InternetGatewayDevice:1.4[](Baseline:1, EthernetLAN:1, WiFiLAN:1, EthernetWAN:1, ADSLWAN:1, IPPing:1, DSLDiagnostics:1, Time:1), VoiceService:1.0[1](Endpoint:1, SIPEndpoint:1)"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.SpecVersion",
            type: "xsd:string", value: "1.0"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.HardwareVersion",
            type: "xsd:string", value: "P-2601HN-F1"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.SoftwareVersion",
            type: "xsd:string", value: "V1.00(AACB.3)"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.ProvisioningCode",
            type: "xsd:string", value: ""},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.ManagementServer.ConnectionRequestURL",
            type: "xsd:string", value: "http://2.110.157.83:7676/CWMP/ConnectionRequest"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.ManagementServer.ParameterKey",
            type: "xsd:string", value: ""},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection.1.ExternalIPAddress",
            type: "xsd:string", value: "2.110.157.83"}]

      }) == @sample)
  end

end

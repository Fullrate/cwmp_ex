defmodule CWMP.Protocol.Generator.InformRequestTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">100</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:Inform>
\t\t\t<DeviceId>
\t\t\t\t<Manufacturer>ZyXEL</Manufacturer>
\t\t\t\t<OUI>EC43F6</OUI>
\t\t\t\t<ProductClass>P-2601HN-F1</ProductClass>
\t\t\t\t<SerialNumber>EC43F69AF408</SerialNumber>
\t\t\t</DeviceId>
\t\t\t<Event SOAP-ENC:arrayType="cwmp:EventStruct[1]">
\t\t\t\t<EventStruct>
\t\t\t\t\t<EventCode>2 PERIODIC</EventCode>
\t\t\t\t\t<CommandKey></CommandKey>
\t\t\t\t</EventStruct>
\t\t\t</Event>
\t\t\t<MaxEnvelopes>1</MaxEnvelopes>
\t\t\t<CurrentTime>2015-01-19T23:08:24+00:00</CurrentTime>
\t\t\t<RetryCount>0</RetryCount>
\t\t\t<ParameterList SOAP-ENC:arrayType="cwmp:ParameterValueStruct[8]">
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>InternetGatewayDevice.DeviceSummary</Name>
\t\t\t\t\t<Value xsi:type="xsd:string">InternetGatewayDevice:1.4[](Baseline:1, EthernetLAN:1, WiFiLAN:1, EthernetWAN:1, ADSLWAN:1, IPPing:1, DSLDiagnostics:1, Time:1), VoiceService:1.0[1](Endpoint:1, SIPEndpoint:1)</Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>InternetGatewayDevice.DeviceInfo.SpecVersion</Name>
\t\t\t\t\t<Value xsi:type="xsd:string">1.0</Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>InternetGatewayDevice.DeviceInfo.HardwareVersion</Name>
\t\t\t\t\t<Value xsi:type="xsd:string">P-2601HN-F1</Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>InternetGatewayDevice.DeviceInfo.SoftwareVersion</Name>
\t\t\t\t\t<Value xsi:type="xsd:string">V1.00(AACB.3)</Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>InternetGatewayDevice.DeviceInfo.ProvisioningCode</Name>
\t\t\t\t\t<Value xsi:type="xsd:string"></Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>InternetGatewayDevice.ManagementServer.ConnectionRequestURL</Name>
\t\t\t\t\t<Value xsi:type="xsd:string">http://2.110.157.83:7676/CWMP/ConnectionRequest</Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>InternetGatewayDevice.ManagementServer.ParameterKey</Name>
\t\t\t\t\t<Value xsi:type="xsd:string"></Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t\t<ParameterValueStruct>
\t\t\t\t\t<Name>InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection.1.ExternalIPAddress</Name>
\t\t\t\t\t<Value xsi:type="xsd:string">2.110.157.83</Value>
\t\t\t\t</ParameterValueStruct>
\t\t\t</ParameterList>
\t\t</cwmp:Inform>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates inform request" do
    assert(CWMP.Protocol.Generator.inform(
      %CWMP.Protocol.Messages.Header{id: "100"},
      %CWMP.Protocol.Messages.InformRequest{
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
        current_time: %Timex.DateTime{calendar: :gregorian,
          day: 19, hour: 23, minute: 8, month: 1, millisecond: 0, second: 24,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
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

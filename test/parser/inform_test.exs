defmodule CWMP.Protocol.Parser.InformTest do
  use ExUnit.Case, async: true

  @sample_2601 """
  <SOAP-ENV:Envelope
    SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:cwmp="urn:dslforum-org:cwmp-1-0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
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
        <CurrentTime>2015-01-19T23:08:24</CurrentTime>
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
  </SOAP-ENV:Envelope>
  """

  @sample_2601_result %{entries: [%CWMP.Protocol.Messages.InformRequest{current_time: %Timex.DateTime{calendar: :gregorian,
          day: 19, hour: 23, minute: 8, month: 1, ms: 0, second: 24,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
        device_id: %CWMP.Protocol.Messages.DeviceIdStruct{manufacturer: "ZyXEL",
          oui: "EC43F6", product_class: "P-2601HN-F1",
          serial_number: "EC43F69AF408"},
        events: [%CWMP.Protocol.Messages.EventStruct{code: "2 PERIODIC",
            command_key: ""}], max_envelopes: 1,
        parameters: [%CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceSummary",
            type: 'xsd:string',
            value: "InternetGatewayDevice:1.4[](Baseline:1, EthernetLAN:1, WiFiLAN:1, EthernetWAN:1, ADSLWAN:1, IPPing:1, DSLDiagnostics:1, Time:1), VoiceService:1.0[1](Endpoint:1, SIPEndpoint:1)"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.SpecVersion",
            type: 'xsd:string', value: "1.0"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.HardwareVersion",
            type: 'xsd:string', value: "P-2601HN-F1"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.SoftwareVersion",
            type: 'xsd:string', value: "V1.00(AACB.3)"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.ProvisioningCode",
            type: 'xsd:string', value: ""},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.ManagementServer.ConnectionRequestURL",
            type: 'xsd:string', value: "http://2.110.157.83:7676/CWMP/ConnectionRequest"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.ManagementServer.ParameterKey",
            type: 'xsd:string', value: ""},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.WANDevice.1.WANConnectionDevice.1.WANIPConnection.1.ExternalIPAddress",
            type: 'xsd:string', value: "2.110.157.83"}], retry_count: 0}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "100",
      session_timeout: 30}}

  test "parses 2601 inform" do
    assert(CWMP.Protocol.Parser.parse!(@sample_2601) == @sample_2601_result)
  end

  @sample_vmg """
  <SOAP-ENV:Envelope
      xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
      xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
      xmlns:xsd="http://www.w3.org/2001/XMLSchema"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
      <SOAP-ENV:Header>
        <cwmp:ID SOAP-ENV:mustUnderstand="1">844317904</cwmp:ID>
      </SOAP-ENV:Header>
      <SOAP-ENV:Body>
        <cwmp:Inform>
          <DeviceId>
            <Manufacturer>ZyXEL</Manufacturer>
            <OUI>4C9EFF</OUI>
            <ProductClass>VMG8924-B10A</ProductClass>
            <SerialNumber>S140Y24025829</SerialNumber>
          </DeviceId>
          <Event SOAP-ENC:arrayType="cwmp:EventStruct[1]">
            <EventStruct>
              <EventCode>6 CONNECTION REQUEST</EventCode>
              <CommandKey></CommandKey>
            </EventStruct>
          </Event>
          <MaxEnvelopes>1</MaxEnvelopes>
          <CurrentTime>2016-01-30T13:20:27+01:00</CurrentTime>
          <RetryCount>0</RetryCount>
          <ParameterList SOAP-ENC:arrayType="cwmp:ParameterValueStruct[0008]">
              <ParameterValueStruct>
                <Name>InternetGatewayDevice.DeviceSummary</Name>
                <Value xsi:type="xsd:string">InternetGatewayDevice:1.4[](Baseline:1, EthernetLAN:1, Time:1, IPPing:1, DeviceAssociation:1, EthernetWAN:1, VDSL2WAN:1, ADSLWAN:1, ATMLoopback:1, WiFiLAN:1, X_5067F0_TrustDomain:1), VoiceService:1.0[1](Endpoint:1, SIPEndpoint:1)</Value>
              </ParameterValueStruct>
              <ParameterValueStruct>
                <Name>InternetGatewayDevice.DeviceInfo.SpecVersion</Name>
                <Value xsi:type="xsd:string">1.0</Value>
              </ParameterValueStruct>
              <ParameterValueStruct>
                <Name>InternetGatewayDevice.DeviceInfo.HardwareVersion</Name>
                <Value xsi:type="xsd:string">HW_1.0</Value>
              </ParameterValueStruct>
              <ParameterValueStruct>
                <Name>InternetGatewayDevice.DeviceInfo.SoftwareVersion</Name>
                <Value xsi:type="xsd:string">1.00(AAQU.1)b20</Value>
              </ParameterValueStruct>
              <ParameterValueStruct>
                <Name>InternetGatewayDevice.DeviceInfo.ProvisioningCode</Name>
                <Value xsi:type="xsd:string">31755,n</Value>
              </ParameterValueStruct>
              <ParameterValueStruct>
                <Name>InternetGatewayDevice.ManagementServer.ConnectionRequestURL</Name>
                <Value xsi:type="xsd:string">http://[2a02:980:1400::1ff]:30005/78DF621FFD24F339452C341BEFE0E8A8</Value>
              </ParameterValueStruct>
              <ParameterValueStruct>
                <Name>InternetGatewayDevice.ManagementServer.ParameterKey</Name>
                <Value xsi:type="xsd:string">fd2cc42d07adccccbf39052325a85f11</Value>
              </ParameterValueStruct>
              <ParameterValueStruct>
                <Name>InternetGatewayDevice.WANDevice.2.WANConnectionDevice.1.WANIPConnection.2.X_5067F0_ExternalIPv6Address</Name>
                <Value xsi:type="xsd:string">2a02:980:1400::1ff/64</Value>
              </ParameterValueStruct>
          </ParameterList>
        </cwmp:Inform>
      </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>
  """

  @sample_vmg_result %{entries: [%CWMP.Protocol.Messages.InformRequest{current_time: %Timex.DateTime{calendar: :gregorian,
          day: 30, hour: 13, minute: 20, month: 1, ms: 0, second: 27,
          timezone: %Timex.TimezoneInfo{abbreviation: "GMT-1", from: :min,
            full_name: "Etc/GMT-1", offset_std: 0, offset_utc: 60, until: :max},
          year: 2016},
        device_id: %CWMP.Protocol.Messages.DeviceIdStruct{manufacturer: "ZyXEL",
          oui: "4C9EFF", product_class: "VMG8924-B10A",
          serial_number: "S140Y24025829"},
        events: [%CWMP.Protocol.Messages.EventStruct{code: "6 CONNECTION REQUEST",
            command_key: ""}], max_envelopes: 1,
        parameters: [%CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceSummary",
            type: 'xsd:string',
            value: "InternetGatewayDevice:1.4[](Baseline:1, EthernetLAN:1, Time:1, IPPing:1, DeviceAssociation:1, EthernetWAN:1, VDSL2WAN:1, ADSLWAN:1, ATMLoopback:1, WiFiLAN:1, X_5067F0_TrustDomain:1), VoiceService:1.0[1](Endpoint:1, SIPEndpoint:1)"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.SpecVersion",
            type: 'xsd:string', value: "1.0"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.HardwareVersion",
            type: 'xsd:string', value: "HW_1.0"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.SoftwareVersion",
            type: 'xsd:string', value: "1.00(AAQU.1)b20"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.DeviceInfo.ProvisioningCode",
            type: 'xsd:string', value: "31755,n"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.ManagementServer.ConnectionRequestURL",
            type: 'xsd:string',
            value: "http://[2a02:980:1400::1ff]:30005/78DF621FFD24F339452C341BEFE0E8A8"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.ManagementServer.ParameterKey",
            type: 'xsd:string', value: "fd2cc42d07adccccbf39052325a85f11"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "InternetGatewayDevice.WANDevice.2.WANConnectionDevice.1.WANIPConnection.2.X_5067F0_ExternalIPv6Address",
            type: 'xsd:string', value: "2a02:980:1400::1ff/64"}], retry_count: 0}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "844317904",
      session_timeout: 30}}

  test "parses VMG inform" do
    assert(CWMP.Protocol.Parser.parse!(@sample_vmg) == @sample_vmg_result)
  end

  @sample_hgw4 """
  <?xml version="1.0" encoding="UTF-8"?>
  <SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
    <SOAP-ENV:Header>
      <cwmp:ID SOAP-ENV:mustUnderstand="1">0</cwmp:ID>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <cwmp:Inform>
        <DeviceId>
          <Manufacturer>Sagemcom</Manufacturer>
          <OUI>40F201</OUI>
          <ProductClass>Router</ProductClass>
          <SerialNumber>LK14183DP340340</SerialNumber>
        </DeviceId>
        <Event xsi:type="SOAP-ENC:Array" SOAP-ENC:arrayType="cwmp:EventStruct[1]">
          <EventStruct>
            <EventCode>2 PERIODIC</EventCode>
            <CommandKey></CommandKey>
          </EventStruct>
        </Event>
        <MaxEnvelopes>1</MaxEnvelopes>
        <CurrentTime>2016-01-31T13:28:09+01:00</CurrentTime>
        <RetryCount>0</RetryCount>
        <ParameterList xsi:type="SOAP-ENC:Array" SOAP-ENC:arrayType="cwmp:ParameterValueStruct[8]">
          <ParameterValueStruct>
            <Name>Device.DeviceInfo.HardwareVersion</Name>
            <Value xsi:type="xsd:string">5DK40-04</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>Device.DeviceInfo.SoftwareVersion</Name>
            <Value xsi:type="xsd:string">SG72113250226</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>Device.DeviceInfo.ProvisioningCode</Name>
            <Value xsi:type="xsd:string">Locked</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>Device.ManagementServer.ParameterKey</Name>
            <Value xsi:type="xsd:string">96da521ed9bc97819416c8a5afb2e245</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>Device.ManagementServer.ConnectionRequestURL</Name>
            <Value xsi:type="xsd:string">http://2.110.222.109:7548/jkflHRnJu3gaSEvt</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>Device.IP.Interface.2.IPv4Address.1.IPAddress</Name>
            <Value xsi:type="xsd:string">2.110.222.109</Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>Device.IP.Interface.3.IPv4Address.1.IPAddress</Name>
            <Value xsi:type="xsd:string"></Value>
          </ParameterValueStruct>
          <ParameterValueStruct>
            <Name>Device.IP.Interface.4.IPv4Address.1.IPAddress</Name>
            <Value xsi:type="xsd:string">172.21.135.245</Value>
          </ParameterValueStruct>
        </ParameterList>
      </cwmp:Inform>
    </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>
  """

  @sample_hgw4_result %{entries: [%CWMP.Protocol.Messages.InformRequest{current_time: %Timex.DateTime{calendar: :gregorian,
          day: 31, hour: 13, minute: 28, month: 1, ms: 0, second: 9,
          timezone: %Timex.TimezoneInfo{abbreviation: "GMT-1", from: :min,
            full_name: "Etc/GMT-1", offset_std: 0, offset_utc: 60,
            until: :max}, year: 2016},
        device_id: %CWMP.Protocol.Messages.DeviceIdStruct{manufacturer: "Sagemcom",
          oui: "40F201", product_class: "Router",
          serial_number: "LK14183DP340340"},
        events: [%CWMP.Protocol.Messages.EventStruct{code: "2 PERIODIC",
            command_key: ""}], max_envelopes: 1,
        parameters: [%CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.DeviceInfo.HardwareVersion",
            type: 'xsd:string', value: "5DK40-04"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.DeviceInfo.SoftwareVersion",
            type: 'xsd:string', value: "SG72113250226"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.DeviceInfo.ProvisioningCode",
            type: 'xsd:string', value: "Locked"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.ManagementServer.ParameterKey",
            type: 'xsd:string', value: "96da521ed9bc97819416c8a5afb2e245"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.ManagementServer.ConnectionRequestURL",
            type: 'xsd:string',
            value: "http://2.110.222.109:7548/jkflHRnJu3gaSEvt"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.IP.Interface.2.IPv4Address.1.IPAddress",
            type: 'xsd:string', value: "2.110.222.109"},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.IP.Interface.3.IPv4Address.1.IPAddress",
            type: 'xsd:string', value: ""},
          %CWMP.Protocol.Messages.ParameterValueStruct{name: "Device.IP.Interface.4.IPv4Address.1.IPAddress",
            type: 'xsd:string', value: "172.21.135.245"}],
        retry_count: 0}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false,
      id: "0", session_timeout: 30}}

  test "parses HGW4 inform" do
    assert(CWMP.Protocol.Parser.parse!(@sample_hgw4) == @sample_hgw4_result)
  end

end
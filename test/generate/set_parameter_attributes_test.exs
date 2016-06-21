defmodule CWMP.Protocol.Generator.SetParameterAttributesTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_7bfc27c1f4f0a2c1d775f8aa1840439e</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:SetParameterAttributes>
\t\t\t<ParameterList SOAP-ENC:arrayType="cwmp:SetParameterAttributeStruct[1]">
\t\t\t\t<ParameterAttributeStruct>
\t\t\t\t\t<Name>Device.Test</Name>
\t\t\t\t\t<NotificationChange>0</NotificationChange>
\t\t\t\t\t<Notification>2</Notification>
\t\t\t\t\t<AccessListChange>1</AccessListChange>
\t\t\t\t\t<AccessList>
\t\t\t\t\t\t<string>Subscriber</string>
\t\t\t\t\t</AccessList>
\t\t\t\t</ParameterAttributeStruct>
\t\t\t</ParameterList>
\t\t</cwmp:SetParameterAttributes>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates SetParameterAttributes request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_7bfc27c1f4f0a2c1d775f8aa1840439e"},%CWMP.Protocol.Messages.SetParameterAttributes{parameters: [
        %CWMP.Protocol.Messages.SetParameterAttributesStruct{
          name: "Device.Test",
          notification_change: false,
          notification: 2,
          accesslist_change: true,
          accesslist: ["Subscriber"]
        }
      ]}) == @sample)
  end

end

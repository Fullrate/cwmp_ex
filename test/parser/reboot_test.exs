defmodule CWMP.Protocol.Parser.RebootTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
    <SOAP-ENV:Header>
      <cwmp:ID SOAP-ENV:mustUnderstand="1">API_953323a9b674bb42b7cad250b2cf0607</cwmp:ID>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <cwmp:Reboot>
        <CommandKey>cmdkey</CommandKey>
      </cwmp:Reboot>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.Reboot{commandkey: "cmdkey"}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_953323a9b674bb42b7cad250b2cf0607",
      session_timeout: 30, no_more_requests: false}}}

  test "parses Reboot request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

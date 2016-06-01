defmodule CWMP.Protocol.Parser.SetVouchersResponseTest do
  use ExUnit.Case, async: true

  @sample """
  <SOAP-ENV:Envelope
    SOAP-ENV:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:cwmp="urn:dslforum-org:cwmp-1-0"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema">
    <SOAP-ENV:Header>
      <cwmp:ID SOAP-ENV:mustUnderstand="1">100</cwmp:ID>
      <cwmp:NoMoreRequests SOAP-ENV:mustUnderstand="1">1</cwmp:NoMoreRequests>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <cwmp:SetVouchersResponse/>
    </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>
  """

  @sample_result %{entries: [%CWMP.Protocol.Messages.SetVouchersResponse{naught: nil}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "100",
      session_timeout: 30, no_more_requests: true}}

  test "parses SetVouchersResponse" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

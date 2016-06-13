defmodule CWMP.Protocol.Parser.InformResponseTest do
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
      <cwmp:InformResponse>
        <MaxEnvelopes>1</MaxEnvelopes>
      </cwmp:InformResponse>
    </SOAP-ENV:Body>
  </SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{entries: [%CWMP.Protocol.Messages.InformResponse{max_envelopes: 1}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "100",
      session_timeout: 30, no_more_requests: true}}}

  test "parses InformResponse" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

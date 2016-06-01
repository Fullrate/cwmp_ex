defmodule CWMP.Protocol.Parser.TransferCompleteResponseTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">1</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:TransferCompleteResponse/>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result %{entries: [%CWMP.Protocol.Messages.TransferCompleteResponse{}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "1",
      session_timeout: 30, no_more_requests: false}}

  test "parses TransferCompleteResponse request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end
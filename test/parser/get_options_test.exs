defmodule CWMP.Protocol.Parser.GetOptionsTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:GetOptions>
      <OptionName>Some Option</OptionName>
    </cwmp:GetOptions>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.GetOptions{
        option_name: "Some Option" }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_69412286f02e475b44783c61972f0a91",
      session_timeout: 30, no_more_requests: false}}}

  test "parses GetOptions request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

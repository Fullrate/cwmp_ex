defmodule CWMP.Protocol.Generator.RequestDownloadResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:RequestDownloadResponse/>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates RequestDownloadResponse" do
    assert(CWMP.Protocol.Generator.request_download_response(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"}) == @sample)
  end

end

defmodule CWMP.Protocol.Generator.UploadTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:Upload>
\t\t\t<CommandKey>CommandKey</CommandKey>
\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t<URL>http://example.com</URL>
\t\t\t<Username>user</Username>
\t\t\t<Password>pass</Password>
\t\t\t<DelaySeconds>5</DelaySeconds>
\t\t</cwmp:Upload>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates full Upload request" do
    assert(CWMP.Protocol.Generator.upload(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.Upload{
        commandkey: "CommandKey",
        filetype: "1 Firmware Upgrade Image",
        url: "http://example.com",
        username: "user",
        password: "pass",
        delay_seconds: 5}) == @sample)
  end

  @sample2 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:Upload>
\t\t\t<CommandKey>CommandKey</CommandKey>
\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t<URL>http://example.com</URL>
\t\t\t<Username></Username>
\t\t\t<Password></Password>
\t\t\t<DelaySeconds>0</DelaySeconds>
\t\t</cwmp:Upload>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates minimal Upload request" do
    assert(CWMP.Protocol.Generator.upload(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.Upload{
        commandkey: "CommandKey",
        filetype: "1 Firmware Upgrade Image",
        url: "http://example.com" }) == @sample2)
  end

  test "raise, nil filetype on Upload request" do
    assert(catch_error(CWMP.Protocol.Generator.upload(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.Upload{}))==%RuntimeError{message: "key filetype can not be nil"})
  end

  test "raise, nil url on Upload request" do
    assert(catch_error(CWMP.Protocol.Generator.upload(
    %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
    %CWMP.Protocol.Messages.Upload{filetype: "1 Firmware Upgrade Image"}))==%RuntimeError{message: "key url can not be nil"})
  end

  test "raise, Invalid filetype on Upload request" do
    assert(catch_error(CWMP.Protocol.Generator.upload(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.Upload{url: "http://example.com", filetype: "6 Something Bogus"}))==%RuntimeError{message: "Invalid filetype"})
  end

end

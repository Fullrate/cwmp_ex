defmodule CWMP.Protocol.Generator.DownloadTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:Download>
\t\t\t<CommandKey>CommandKey</CommandKey>
\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t<URL>http://example.com</URL>
\t\t\t<FileSize>100</FileSize>
\t\t\t<DelaySeconds>5</DelaySeconds>
\t\t\t<FailureURL>http://example.com/failure</FailureURL>
\t\t\t<Password>pass</Password>
\t\t\t<SuccessURL>http://example.com/success</SuccessURL>
\t\t\t<TargetFileName>foo</TargetFileName>
\t\t\t<Username>user</Username>
\t\t</cwmp:Download>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates full Download request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.Download{commandkey: "CommandKey", filetype: "1 Firmware Upgrade Image", url: "http://example.com", username: "user", password: "pass", filesize: 100, target_filename: "foo", delay_seconds: 5, success_url: "http://example.com/success", failure_url: "http://example.com/failure"}) == @sample)
  end

  @sample2 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:Download>
\t\t\t<CommandKey>CommandKey</CommandKey>
\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t<URL>http://example.com</URL>
\t\t\t<FileSize>100</FileSize>
\t\t\t<DelaySeconds>5</DelaySeconds>
\t\t\t<FailureURL>http://example.com/failure</FailureURL>
\t\t\t<Password>pass</Password>
\t\t\t<SuccessURL>http://example.com/success</SuccessURL>
\t\t\t<Username>user</Username>
\t\t</cwmp:Download>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 2nd Download request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.Download{commandkey: "CommandKey", filetype: "1 Firmware Upgrade Image", url: "http://example.com", username: "user", password: "pass", filesize: 100, delay_seconds: 5, success_url: "http://example.com/success", failure_url: "http://example.com/failure"}) == @sample2)
  end

  @sample3 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:Download>
\t\t\t<CommandKey>CommandKey</CommandKey>
\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t<URL>http://example.com</URL>
\t\t\t<FileSize>100</FileSize>
\t\t\t<DelaySeconds>5</DelaySeconds>
\t\t\t<Password>pass</Password>
\t\t\t<Username>user</Username>
\t\t</cwmp:Download>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 3nd Download request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.Download{commandkey: "CommandKey", filetype: "1 Firmware Upgrade Image", url: "http://example.com", username: "user", password: "pass", filesize: 100, delay_seconds: 5 }) == @sample3)
  end

  @sample4 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:Download>
\t\t\t<CommandKey>CommandKey</CommandKey>
\t\t\t<FileType>1 Firmware Upgrade Image</FileType>
\t\t\t<URL>http://example.com</URL>
\t\t\t<FileSize>100</FileSize>
\t\t</cwmp:Download>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates 4nd Download request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.Download{commandkey: "CommandKey", filetype: "1 Firmware Upgrade Image", url: "http://example.com", filesize: 100 }) == @sample4)
  end



  test "raise, nil filetype on Download request" do
    assert(catch_error(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.Download{}))==%RuntimeError{message: "key filetype can not be nil"})
  end

  test "raise, nil url on Download request" do
    assert(catch_error(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.Download{filetype: "1 Firmware Upgrade Image"}))==%RuntimeError{message: "key url can not be nil"})
  end

  test "raise, Invalid filetype on Download request" do
    assert(catch_error(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.Download{url: "http://example.com", filetype: "6 Something Bogus"}))==%RuntimeError{message: "Invalid filetype"})
  end

  test "raise, Invalid filesize on Download request" do
    assert(catch_error(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.Download{commandkey: "CommandKey", filetype: "1 Firmware Upgrade Image", url: "http://example.com", username: "user", password: "pass", filesize: "size", target_filename: "foo", delay_seconds: 5, success_url: "http://example.com/success", failure_url: "http://example.com/failure"}))==%RuntimeError{message: "Integer value does not parse"})
  end

  test "raise, negative filesize on Download request" do
    assert(catch_error(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.Download{commandkey: "CommandKey", filetype: "1 Firmware Upgrade Image", url: "http://example.com", username: "user", password: "pass", filesize: -1, target_filename: "foo", delay_seconds: 5, success_url: "http://example.com/success", failure_url: "http://example.com/failure"}))==%RuntimeError{message: "Integer does not validate"})
  end

end

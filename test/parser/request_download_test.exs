defmodule CWMP.Protocol.Parser.RequestDownloadTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:RequestDownload>
                  <FileType>2 Web Content</FileType>
                  <FileTypeArg SOAP-ENC:arrayType="cwmp:ArgStruct[1]">
                     <ArgStruct>
                       <Name>Version</Name>
                       <Value>v2.0</Value>
                     </ArgStruct>
                  </FileTypeArg>
                </cwmp:RequestDownload>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{cwmp_version: "urn:dslforum-org:cwmp-1-0",
    entries: [%CWMP.Protocol.Messages.RequestDownload{
        filetype: "2 Web Content",
        filetype_arg: [
          %CWMP.Protocol.Messages.ArgStruct{
            name: "Version",
            value: "v2.0"}]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50",
      session_timeout: 30, no_more_requests: false}}}

  test "parses RequestDownload request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

defmodule CWMP.Protocol.Parser.SetParameterValuesResponseTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:SetParameterValuesResponse>
                  <Status>0</Status>
                </cwmp:SetParameterValuesResponse>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{entries: [%CWMP.Protocol.Messages.SetParameterValuesResponse{
        status: 0}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50",
      session_timeout: 30, no_more_requests: false}}}

  test "parses SetParameterValuesResponse request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

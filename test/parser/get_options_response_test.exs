defmodule CWMP.Protocol.Parser.GetOptionsResponseTest do
  use ExUnit.Case, async: true
  import TestHelpers

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:GetOptionsResponse>
      <OptionList SOAP-ENC:arrayType="cwmp:OptionStruct[2]">
        <OptionStruct>
          <OptionName>First Option</OptionName>
          <VoucherSN>12345678</VoucherSN>
          <State>1</State>
          <Mode>1</Mode>
          <StartDate>2015-01-10T23:45:12+00:00</StartDate>
          <ExpirationDate>2015-01-10T23:45:12+00:00</ExpirationDate>
          <IsTransferable>1</IsTransferable>
        </OptionStruct>
        <OptionStruct>
          <OptionName>Second Option</OptionName>
          <VoucherSN>12345678</VoucherSN>
          <State>1</State>
          <Mode>1</Mode>
          <StartDate>2015-01-10T23:45:12+00:00</StartDate>
          <ExpirationDate>2015-01-10T23:45:12+00:00</ExpirationDate>
          <IsTransferable>1</IsTransferable>
        </OptionStruct>
      </OptionList>
    </cwmp:GetOptionsResponse>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.GetOptionsResponse{
        optionlist: [
          %CWMP.Protocol.Messages.OptionStruct{
            option_name: "First Option",
            voucher_sn: 12345678,
            state: 1,
            mode: 1,
            start_date: generate_datetime({{10,1,2015},{23,45,12}}),
            expiration_date: generate_datetime({{10,1,2015},{23,45,12}}),
            is_transferable: true},
          %CWMP.Protocol.Messages.OptionStruct{
            option_name: "Second Option",
            voucher_sn: 12345678,
            state: 1,
            mode: 1,
            start_date: generate_datetime({{10,1,2015},{23,45,12}}),
            expiration_date: generate_datetime({{10,1,2015},{23,45,12}}),
            is_transferable: true}]
          }],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "API_69412286f02e475b44783c61972f0a91",
      session_timeout: 30, no_more_requests: false}}}

  test "parses GetOptionsResponse" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

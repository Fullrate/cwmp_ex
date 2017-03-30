defmodule CWMP.Protocol.Generator.TransferCompleteTest do
  use ExUnit.Case, async: true
  import TestHelpers

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:TransferComplete>
\t\t\t<CommandKey>CommandKey</CommandKey>
\t\t\t<FaultStruct>
\t\t\t\t<FaultCode>0</FaultCode>
\t\t\t\t<FaultString></FaultString>
\t\t\t</FaultStruct>
\t\t\t<StartTime>2015-01-19T23:08:24Z</StartTime>
\t\t\t<CompleteTime>2015-01-19T23:18:24Z</CompleteTime>
\t\t</cwmp:TransferComplete>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates TransferComplete request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"}, %CWMP.Protocol.Messages.TransferComplete{
      command_key: "CommandKey",
      fault_struct: %CWMP.Protocol.Messages.FaultStruct{ code: 0, string: "" },
      start_time: generate_datetime({{19,1,2015},{23,8,24}}),
      complete_time: generate_datetime({{19,1,2015},{23,18,24}}) }) == @sample)
  end

end

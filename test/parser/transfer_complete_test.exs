defmodule CWMP.Protocol.Parser.TransferCompleteTest do
  use ExUnit.Case, async: true
  import TestHelpers

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">1</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:TransferComplete>
                        <CommandKey>AutoconfFirmwareUpgrade</CommandKey>
                        <FaultStruct>
                                <FaultCode>0</FaultCode>
                                <FaultString></FaultString>
                        </FaultStruct>
                        <StartTime>2016-04-07T08:43:49Z</StartTime>
                        <CompleteTime>2016-04-07T08:45:06Z</CompleteTime>
                </cwmp:TransferComplete>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

  @sample_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.TransferComplete{complete_time: generate_datetime({{7,4,2016},{8,45,6}}),
          start_time: generate_datetime({{7,4,2016},{8,43,49}}),
      command_key: "AutoconfFirmwareUpgrade",
      fault_struct: %CWMP.Protocol.Messages.FaultStruct{code: 0, string: ""}}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "1",
      session_timeout: 30, no_more_requests: false}}}

  test "parses transfer complete request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

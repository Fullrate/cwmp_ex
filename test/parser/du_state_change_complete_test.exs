defmodule CWMP.Protocol.Parser.DUStateChangeCompleteTest do
  use ExUnit.Case, async: true
  import TestHelpers

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:DUStateChangeComplete>
                  <CommandKey>cmdkey</CommandKey>
                  <Results SOAP-ENC:arrayType="cwmp:OpResultStruct[1]">
                    <OpResultStruct>
                      <UUID>some-uuid</UUID>
                      <DeploymentUnitRef>uref</DeploymentUnitRef>
                      <Version>v2.1</Version>
                      <CurrentState>curState</CurrentState>
                      <Resolved>1</Resolved>
                      <ExecutionUnitRefList>a,b,c</ExecutionUnitRefList>
                      <StartTime>2015-01-19T23:45:12+00:00</StartTime>
                      <CompleteTime>2015-01-19T23:55:12+00:00</CompleteTime>
                      <Fault>
                        <FaultStruct>
                          <FaultCode>0</FaultCode>
                          <FaultString></FaultString>
                        </FaultStruct>
                      </Fault>
                    </OpResultStruct>
                  </Results>
                </cwmp:DUStateChangeComplete>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{cwmp_version: "1-0", entries: [%CWMP.Protocol.Messages.DUStateChangeComplete{
        commandkey: "cmdkey",
        results: [
          %CWMP.Protocol.Messages.OpResultStruct{
            uuid: "some-uuid",
            deployment_unit_ref: "uref",
            version: "v2.1",
            current_state: "curState",
            resolved: true,
            execution_unit_ref_list: "a,b,c",
            start_time: generate_datetime({{19,1,2015},{23,45,12}}),
            complete_time: generate_datetime({{19,1,2015},{23,55,12}}),
            fault: %CWMP.Protocol.Messages.FaultStruct{
              code: 0,
              string: ""
            }
          }]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50",
      session_timeout: 30, no_more_requests: false}}}

  test "parses DUStateChangeComplete request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

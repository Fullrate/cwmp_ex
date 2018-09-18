defmodule CWMP.Protocol.Generator.AutonomousDUStateChangeCompleteTest do
  use ExUnit.Case, async: true
  import TestHelpers

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:AutonomousDUStateChangeComplete>
      <Results SOAP-ENC:arrayType="cwmp:AutonOpResultStruct[1]">
        <AutonOpResultStruct>
          <UUID>some-uuid</UUID>
          <DeploymentUnitRef>uref</DeploymentUnitRef>
          <Version>v2.1</Version>
          <CurrentState>curState</CurrentState>
          <Resolved>1</Resolved>
          <ExecutionUnitRefList>a,b,c</ExecutionUnitRefList>
          <StartTime>2015-01-19T23:45:12Z</StartTime>
          <CompleteTime>2015-01-19T23:55:12Z</CompleteTime>
          <Fault>
            <FaultStruct>
              <FaultCode>0</FaultCode>
              <FaultString></FaultString>
            </FaultStruct>
          </Fault>
          <OperationPerformed>Install</OperationPerformed>
        </AutonOpResultStruct>
      </Results>
    </cwmp:AutonomousDUStateChangeComplete>
  </SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates DUStateChangeComplete request" do
    assert(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.AutonomousDUStateChangeComplete{
        results: [
          %CWMP.Protocol.Messages.AutonOpResultStruct{
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
            },
            operation_performed: "Install"
          }
        ]}) == @sample)
  end

end

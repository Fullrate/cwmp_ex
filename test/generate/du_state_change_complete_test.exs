defmodule CWMP.Protocol.Generator.DUStateChangeCompleteTest do
  use ExUnit.Case, async: true
  import TestHelpers

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:DUStateChangeComplete>
\t\t\t<CommandKey>cmdkey</CommandKey>
\t\t\t<Results SOAP-ENC:arrayType="cwmp:OpResultStruct[1]">
\t\t\t\t<OpResultStruct>
\t\t\t\t\t<UUID>some-uuid</UUID>
\t\t\t\t\t<DeploymentUnitRef>uref</DeploymentUnitRef>
\t\t\t\t\t<Version>v2.1</Version>
\t\t\t\t\t<CurrentState>curState</CurrentState>
\t\t\t\t\t<Resolved>1</Resolved>
\t\t\t\t\t<ExecutionUnitRefList>a,b,c</ExecutionUnitRefList>
\t\t\t\t\t<StartTime>2015-01-19T23:45:12Z</StartTime>
\t\t\t\t\t<CompleteTime>2015-01-19T23:55:12Z</CompleteTime>
\t\t\t\t\t<Fault>
\t\t\t\t\t\t<FaultStruct>
\t\t\t\t\t\t\t<FaultCode>0</FaultCode>
\t\t\t\t\t\t\t<FaultString></FaultString>
\t\t\t\t\t\t</FaultStruct>
\t\t\t\t\t</Fault>
\t\t\t\t</OpResultStruct>
\t\t\t</Results>
\t\t</cwmp:DUStateChangeComplete>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates DUStateChangeComplete request" do
    assert(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.DUStateChangeComplete{
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
          }
        ]}) == @sample)
  end

end

defmodule CWMP.Protocol.Parser.AutonomousDUStateChangeCompleteTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
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
                      <StartTime>2015-01-19T23:45:12+00:00</StartTime>
                      <CompleteTime>2015-01-19T23:55:12+00:00</CompleteTime>
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
</SOAP-ENV:Envelope>
  """

  @sample_result %{entries: [%CWMP.Protocol.Messages.AutonomousDUStateChangeComplete{
        results: [
          %CWMP.Protocol.Messages.AutonOpResultStruct{
            uuid: "some-uuid",
            deployment_unit_ref: "uref",
            version: "v2.1",
            current_state: "curState",
            resolved: true,
            execution_unit_ref_list: "a,b,c",
            start_time: %Timex.DateTime{
              calendar: :gregorian,
              day: 19,
              hour: 23,
              minute: 45,
              month: 1,
              millisecond: 0,
              second: 12,
              timezone: %Timex.TimezoneInfo{
                abbreviation: "UTC",
                from: :min,
                full_name: "UTC",
                offset_std: 0,
                offset_utc: 0,
                until: :max},
              year: 2015},
            complete_time: %Timex.DateTime{
              calendar: :gregorian,
              day: 19,
              hour: 23,
              minute: 55,
              month: 1,
              millisecond: 0,
              second: 12,
              timezone: %Timex.TimezoneInfo{
                abbreviation: "UTC",
                from: :min,
                full_name: "UTC",
                offset_std: 0,
                offset_utc: 0,
                until: :max},
              year: 2015},
            fault: %CWMP.Protocol.Messages.FaultStruct{
              code: 0,
              string: ""
            },
            operation_performed: "Install"
          }]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50",
      session_timeout: 30, no_more_requests: false}}

  test "parses AutonomousDUStgateChangeComplete request" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

end

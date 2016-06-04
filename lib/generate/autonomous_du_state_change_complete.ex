defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.AutonomousDUStateChangeComplete do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    olist=for o <- req.results, do: element(:AutonOpResultStruct, [
      element(:UUID, o.uuid),
      element(:DeploymentUnitRef, o.deployment_unit_ref),
      element(:Version, o.version),
      element(:CurrentState, o.current_state),
      element(:Resolved, boolValue(o.resolved)),
      element(:ExecutionUnitRefList, o.execution_unit_ref_list),
      element(:StartTime, timeString(o.start_time)),
      element(:CompleteTime, timeString(o.complete_time)),
      element(:Fault, [faultStruct(o.fault)]),
      element(:OperationPerformed, o.operation_performed)
    ])

    element("cwmp:AutonomousDUStateChangeComplete", [
      element(:Results, %{"SOAP-ENC:arrayType": "cwmp:AutonOpResultStruct[#{length(olist)}]"}, olist)])
  end

end


defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.DUStateChangeComplete do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    element("cwmp:DUStateChangeComplete", [
      element(:CommandKey,req.commandkey) ] ++
      [ generateOperationsList(req.results) ] )
  end

  defp generateOperationsList(operations) do
    olist=for o <- operations, do: element(:OpResultStruct, [
      element(:UUID, o.uuid),
      element(:DeploymentUnitRef, o.deployment_unit_ref),
      element(:Version, o.version),
      element(:CurrentState, o.current_state),
      element(:Resolved, boolValue(o.resolved)),
      element(:ExecutionUnitRefList, o.execution_unit_ref_list),
      element(:StartTime, timeString(o.start_time)),
      element(:CompleteTime, timeString(o.complete_time)),
      element(:Fault, [faultStruct(o.fault)])])

    element(:Results, %{"SOAP-ENC:arrayType": "cwmp:OpResultStruct[#{length(olist)}]"}, olist)
  end

end


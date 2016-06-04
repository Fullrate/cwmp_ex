defmodule CWMP.Protocol.Parser.Messages.AutonOpResultStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.AutonOpResultStruct

  def initial_acc do
    %AutonOpResultStruct{}
  end

  def start_element(state, ['FaultStruct','Fault'], _attribs) do
    push_handler(state, FaultStruct)
  end

  def end_element(state, ['FaultStruct','Fault']) do
    update_acc(state, fn acc -> %AutonOpResultStruct{acc | fault: state.last_acc} end)
  end

  def end_element(state, ['UUID']) do
    update_acc(state, fn cur -> %AutonOpResultStruct{cur | uuid: state.last_text} end)
  end

  def end_element(state, ['DeploymentUnitRef']) do
    update_acc(state, fn cur -> %AutonOpResultStruct{cur | deployment_unit_ref: state.last_text} end)
  end

  def end_element(state, ['Version']) do
    update_acc(state, fn cur -> %AutonOpResultStruct{cur | version: state.last_text} end)
  end

  def end_element(state, ['CurrentState']) do
    update_acc(state, fn cur -> %AutonOpResultStruct{cur | current_state: state.last_text} end)
  end

  def end_element(state, ['Resolved']) do
    update_acc(state, fn cur -> %AutonOpResultStruct{cur | resolved: boolValue(state.last_text)} end)
  end

  def end_element(state, ['ExecutionUnitRefList']) do
    update_acc(state, fn cur -> %AutonOpResultStruct{cur | execution_unit_ref_list: state.last_text} end)
  end

  def end_element(state, ['StartTime']) do
    update_acc(state, fn cur -> %AutonOpResultStruct{cur | start_time: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['CompleteTime']) do
    update_acc(state, fn cur -> %AutonOpResultStruct{cur | complete_time: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['OperationPerformed']) do
    update_acc(state, fn cur -> %AutonOpResultStruct{cur | operation_performed: state.last_text} end)
  end

end

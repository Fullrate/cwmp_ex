defmodule CWMP.Protocol.Parser.Messages.OpResultStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.OpResultStruct

  def initial_acc do
    %OpResultStruct{}
  end

  def start_element(state, ['FaultStruct','Fault'], _attribs, _uri) do
    push_handler(state, FaultStruct)
  end

  def end_element(state, ['FaultStruct','Fault']) do
    update_acc(state, fn acc -> %OpResultStruct{acc | fault: state.last_acc} end)
  end

  def end_element(state, ['UUID']) do
    update_acc(state, fn cur -> %OpResultStruct{cur | uuid: state.last_text} end)
  end

  def end_element(state, ['DeploymentUnitRef']) do
    update_acc(state, fn cur -> %OpResultStruct{cur | deployment_unit_ref: state.last_text} end)
  end

  def end_element(state, ['Version']) do
    update_acc(state, fn cur -> %OpResultStruct{cur | version: state.last_text} end)
  end

  def end_element(state, ['CurrentState']) do
    update_acc(state, fn cur -> %OpResultStruct{cur | current_state: state.last_text} end)
  end

  def end_element(state, ['Resolved']) do
    update_acc(state, fn cur -> %OpResultStruct{cur | resolved: boolValue(state.last_text)} end)
  end

  def end_element(state, ['ExecutionUnitRefList']) do
    update_acc(state, fn cur -> %OpResultStruct{cur | execution_unit_ref_list: state.last_text} end)
  end

  def end_element(state, ['StartTime']) do
    update_acc(state, fn cur -> %OpResultStruct{cur | start_time: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['CompleteTime']) do
    update_acc(state, fn cur -> %OpResultStruct{cur | complete_time: datetimeStructure(state.last_text)} end)
  end

end

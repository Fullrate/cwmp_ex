defmodule CWMP.Protocol.Parser.Messages.GetParameterNames do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.GetParameterNames

  def initial_acc do
    %GetParameterNames{}
  end

  def end_element(state, ['ParameterPath']) do
    update_acc(state, fn acc -> %GetParameterNames{acc | parameter_path: state.last_text} end)
  end

  def end_element(state, ['NextLevel']) do
    update_acc(state, fn cur -> %GetParameterNames{cur | next_level: boolValue(state.last_text)} end)
  end
end


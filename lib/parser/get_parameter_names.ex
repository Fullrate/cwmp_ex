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
    case Integer.parse(state.last_text) do
      {val, ""} when val in 0..1  -> case val do
        0 -> update_acc(state, fn cur -> %GetParameterNames{cur | next_level: false} end)
        _ -> update_acc(state, fn cur -> %GetParameterNames{cur | next_level: true} end)
      end
      _ -> raise "Invalid NextLevel value"
    end
  end
end


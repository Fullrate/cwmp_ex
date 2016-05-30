defmodule CWMP.Protocol.Parser.Messages.AddObject do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.AddObject

  def initial_acc do
    %AddObject{}
  end

  def end_element(state, ['ObjectName']) do
    # ObjectName must end with a .
    case String.last( state.last_text ) do
      "." -> update_acc(state, fn cur -> %AddObject{cur | object_name: state.last_text} end)
      _ -> raise "Invalid object_name value"
    end
  end

  def end_element(state, ['ParameterKey']) do
    update_acc(state, fn cur -> %AddObject{cur | parameter_key: state.last_text} end)
  end
end


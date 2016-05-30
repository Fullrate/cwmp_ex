defmodule CWMP.Protocol.Parser.Messages.DeleteObject do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.DeleteObject

  def initial_acc do
    %DeleteObject{}
  end

  def end_element(state, ['ObjectName']) do
    case String.last(state.last_text) do
      "." -> update_acc(state, fn cur -> %DeleteObject{cur | object_name: state.last_text} end)
      _ -> raise "Invalid ObjectName value"
    end
  end

  def end_element(state, ['ParameterKey']) do
    update_acc(state, fn cur -> %DeleteObject{cur | parameter_key: state.last_text} end)
  end

end


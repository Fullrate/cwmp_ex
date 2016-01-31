defmodule CWMP.Protocol.Parser do
  alias CWMP.Protocol.Parser.ElemState
  alias CWMP.Protocol.Parser.State

  def parse!(source, _opts \\ []) do
    {:ok, %State{curstate: %ElemState{acc: acc}}, _} = :erlsom.parse_sax(source, initial_state, &parse_step/2)
    acc
  end

  def initial_elem_state(handler) do
    %ElemState{handler: handler, acc: handler.initial_acc}
  end

  defp initial_state do
    %State{curstate: initial_elem_state(Elixir.CWMP.Protocol.Parser.Envelope),
           stack:    [%ElemState{}]}
  end

  defp parse_step({:characters, chars}, state) do
    %State{state | last_text: String.strip("#{chars}")}
  end

  defp parse_step({:startElement, _uri, name, _prefix, attribs}, state) do
    newpath = [name | state.curstate.path]
    newinner = %ElemState{state.curstate | path: newpath}
    state = %State{state | curstate: newinner}
    state = state.curstate.handler.start_element(state, newpath, attribs)
    %State{state | last_text: ""}
  end

  defp parse_step({:endElement, _uri, _name, _prefix}, state) do
    state = case state.curstate.path do
      [] -> # Empty, so pop off the handler stack
        case state.stack do
          [newcur | rest] -> 
            %State{state | curstate: newcur, stack: rest, last_acc: state.curstate.acc}
          _ -> raise "Imbalanced tags"
        end
      _ -> state
    end
    curpath = state.curstate.path
    state = %State{state | curstate: %ElemState{state.curstate | path: Enum.drop(curpath, 1)}}

    state = case state.curstate.handler do
      nil -> %State{state | curstate: %ElemState{state.curstate | acc: state.last_acc}}
      handler -> handler.end_element(state, curpath)
    end
    %State{state | last_text: ""}
  end

  defp parse_step(_, state) do
    state
  end
end

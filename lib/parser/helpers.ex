defmodule CWMP.Protocol.Parser.ElemState do
  defstruct path: [],
            handler: nil,
            acc: nil
end

defmodule CWMP.Protocol.Parser.State do
  defstruct stack: [],
            last_text: "",
            curstate: nil,
            last_acc: nil
end

defmodule CWMP.Protocol.ParserHelpers do
  alias CWMP.Protocol.Parser.ElemState
  alias CWMP.Protocol.Parser.State

  defmacro __using__(_opts) do
    quote do
      import CWMP.Protocol.ParserHelpers
      @before_compile CWMP.Protocol.ParserHelpers
    end
  end

  defmacro __before_compile__(_opts) do
    # All unhandled start and end elements are simply ignored.
    quote do
      def start_element(state, _path, _attribs) do
        state
      end

      def end_element(state, _path) do
        state
      end
    end
  end

  # Pushes a new state onto the handler stack.
  def push_handler(state, handler) do
    newelem = %ElemState{handler: handler, acc: handler.initial_acc}
    %State{curstate: newelem, stack: [state.curstate | state.stack]}
  end

  # Applies a function to the current state accumulator.
  def update_acc(state, fun) do
    %State{state | curstate: %ElemState{state.curstate | acc: fun.(state.curstate.acc)}}
  end
end


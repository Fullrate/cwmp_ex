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
      def start_element(state, _path, _attribs, _uri) do
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

  @doc """

  Ensures that the passed value is an integer and that it satisfies
  the restraints layed out by the anon function passed.

  """
  def integerValue(i, fun \\ fn x -> x end)

  def integerValue(i, fun) when is_integer(i) do
    if fun.(i) do
      i
    else
      raise "Integer does not validate"
    end
  end

  def integerValue(i, fun) do
    case Integer.parse(i) do
      {v, ""} ->
        if fun.(v) do
          v
        else
          raise "Integer does not validate"
        end

      _ ->
        raise "Integer value does not parse"
    end
  end

  def required_datetimeStructure(timestring) do
    case DateTime.from_iso8601(timestring) do
      {:ok, dt, utc_offset} ->
        %DateTime{dt | utc_offset: utc_offset}

      {:error, :missing_offset} ->
        # assume datetime to be a relative time since boot
        datetimeStructure(timestring <> "Z")

      {:error, reason} ->
        # the unparsable datetime must fail here
        raise "timestring '#{timestring}' is unparseable: #{inspect(reason)}"
        :error
    end
  end

  def datetimeStructure(timestring) do
    case DateTime.from_iso8601(timestring) do
      {:ok, dt, utc_offset} ->
        %DateTime{dt | utc_offset: utc_offset}

      {:error, :missing_offset} ->
        # assume datetime to be a relative time since boot
        datetimeStructure(timestring <> "Z")

      {:error, _reason} ->
        # the unparsable datetime must return the Unknown datetime here
        datetimeStructure("0001-01-01T00:00:00Z")
    end
  end

  def boolValue(s) do
    case s do
      "0" -> false
      _ -> true
    end
  end

  @doc """
    Returns nil or a "x-y" string extrapolated from the uri
    if it matches the pattern of a cwmp version.
  """
  def parse_cwmp_version(uri) do
    case Regex.run(~r/.*dslforum-org:cwmp-(\d-\d)$/, uri) do
      [_, ver] -> ver
      _ -> nil
    end
  end
end

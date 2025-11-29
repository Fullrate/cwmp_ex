defmodule CWMP.Protocol.Parser.ParseError do
  @moduledoc """
  Used for representing parse errors during CWMP envelope parsing
  """

  defexception message: "Parse error"
end


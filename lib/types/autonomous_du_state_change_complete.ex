defmodule CWMP.Protocol.Messages.AutonomousDUStateChangeComplete do
  @derive [Poison.Encoder]
  defstruct results: []
end

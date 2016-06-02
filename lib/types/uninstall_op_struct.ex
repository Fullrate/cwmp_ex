defmodule CWMP.Protocol.Messages.UninstallOpStruct do
  @derive [Poison.Encoder]
  defstruct url:               nil,
            uuid:              nil,
            execution_env_ref: nil
end

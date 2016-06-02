defmodule CWMP.Protocol.Messages.InstallOpStruct do
  @derive [Poison.Encoder]
  defstruct url:               nil,
            uuid:              nil,
            username:          nil,
            password:          nil,
            execution_env_ref: nil
end

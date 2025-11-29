defmodule CWMP.Protocol.Messages.KeyValueStruct do
  @derive [Poison.Encoder]

  @moduledoc """

  This structure is for the SetVouchers method
  and is to be contains within a KeyInfoStruct.

  It specifically centers around dsa key information

  """
  defstruct dsa_p:   nil, # string
            dsa_q:   nil, # string
            dsa_g:   nil, # string
            dsa_y:   nil  # string
end

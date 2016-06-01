defmodule CWMP.Protocol.Messages.X509IssuerSerialStruct do
  @derive [Poison.Encoder]

  @moduledoc """

  This structure is for the SetVouchers method
  and is to be contains within a X509DataStruct.

  """
  defstruct issuer_name:   nil, # string
            serial_number: 0  # unsignedInt
end

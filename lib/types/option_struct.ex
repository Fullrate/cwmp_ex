defmodule CWMP.Protocol.Messages.OptionStruct do
  @derive [Poison.Encoder]

  @moduledoc """

  This structure is for the GetOptions method

  """
  defstruct option_name:     nil, # string(64)
            voucher_sn:      0,   # unsignedInt
            state:           0,   # unsignedInt
            mode:            0,   # int[0:2]
            start_date:      nil,
            expiration_date: nil,
            is_transferable: false
end

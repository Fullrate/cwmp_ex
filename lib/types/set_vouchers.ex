defmodule CWMP.Protocol.Messages.SetVouchers do
  @derive [Poison.Encoder]
  defstruct voucherlist: []
end

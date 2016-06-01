defmodule CWMP.Protocol.Parser.Messages.SetVouchers do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.SetVouchers

  def initial_acc do
    %SetVouchers{}
  end

  def end_element(state, ['base64', 'VoucherList']) do
    update_acc(state, fn acc -> %SetVouchers{acc | voucherlist: acc.voucherlist ++ [state.last_text]} end)
  end
end


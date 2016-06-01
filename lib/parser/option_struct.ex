defmodule CWMP.Protocol.Parser.Messages.OptionStruct do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.OptionStruct

  def initial_acc do
    %OptionStruct{}
  end

  def end_element(state, ['OptionName']) do
    update_acc(state, fn cur -> %OptionStruct{cur | option_name: state.last_text} end)
  end

  def end_element(state, ['VoucherSN']) do
    update_acc(state, fn cur -> %OptionStruct{cur | voucher_sn: integerValue(state.last_text, fn(x) -> x >= 0 end)} end)
  end

  def end_element(state, ['State']) do
    update_acc(state, fn cur -> %OptionStruct{cur | state: integerValue(state.last_text, fn(x) -> x >= 0 end)} end)
  end

  def end_element(state, ['Mode']) do
    update_acc(state, fn cur -> %OptionStruct{cur | mode: integerValue(state.last_text, fn(x) -> x in 0..2 end)} end)
  end

  def end_element(state, ['StartDate']) do
    update_acc(state, fn cur -> %OptionStruct{cur | start_date: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['ExpirationDate']) do
    update_acc(state, fn cur -> %OptionStruct{cur | expiration_date: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['IsTransferable']) do
    update_acc(state, fn cur -> %OptionStruct{cur | is_transferable: boolValue(state.last_text)} end)
  end

end

defmodule CWMP.Protocol.Generator.Messages.GetOptionsResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    olist = generateOptions(req.optionlist)
    element("cwmp:GetOptionsResponse", [
      element(:OptionList, %{"SOAP-ENC:arrayType": "cwmp:OptionStruct[#{length(olist)}]"}, olist) ])
  end

  defp generateOptions(optionlist) do
    for o <- optionlist, do: element(:OptionStruct, [
      element(:OptionName, o.option_name),
      element(:VoucherSN, integerValue(o.voucher_sn, fn(x) -> x > 0 end)),
      element(:State, integerValue(o.state, fn(x) -> x in 0..2 end)),
      element(:Mode, integerValue(o.state, fn(x) -> x > 0 end)),
      element(:StartDate, timeString(o.start_date)),
      element(:ExpirationDate, timeString(o.expiration_date)),
      element(:IsTransferable, boolValue(o.is_transferable))])
  end
end


defmodule CWMP.Protocol.Parser.Messages.SetVouchersResponse do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.SetVouchersResponse

  def initial_acc do
    %SetVouchersResponse{}
  end

end


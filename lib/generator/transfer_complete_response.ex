defmodule CWMP.Protocol.Generator.Messages.TransferCompleteResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate do
    element("cwmp:TransferCompleteResponse", nil)
  end

end


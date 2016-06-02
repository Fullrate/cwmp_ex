defmodule CWMP.Protocol.Generator.Messages.CancelTransferResponse do
  import XmlBuilder

  def generate do
    element("cwmp:CancelTransferResponse", nil)
  end
end

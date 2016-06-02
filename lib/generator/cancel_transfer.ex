defmodule CWMP.Protocol.Generator.Messages.CancelTransfer do
  import XmlBuilder

  def generate(req) do
    element("cwmp:CancelTransfer", [element(:CommandKey, req.commandkey)])
  end
end

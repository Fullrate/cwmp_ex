defmodule CWMP.Protocol.Generator.Messages.Header do
  import XmlBuilder

  def generate(msg) do
    element('cwmp:ID', %{'SOAP-ENV:mustUnderstand': 1}, msg.id)
  end
end


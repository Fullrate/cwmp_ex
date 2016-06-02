defmodule CWMP.Protocol.Generator.Messages.InformResponse do
  import XmlBuilder

  def generate(resp) do
    element("cwmp:InformResponse", [element(:MaxEnvelopes, resp.max_envelopes)])
  end
end


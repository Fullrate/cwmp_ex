defmodule CWMP.Protocol.Generator.Messages.KickedResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    element("cwmp:KickedResponse", [
      element(:NextURL,req.next_url) ])
  end
end

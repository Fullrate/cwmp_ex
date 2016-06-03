defmodule CWMP.Protocol.Generator.Messages.Kicked do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    element("cwmp:Kicked", [
      element(:Command,req.command),
      element(:Referer,req.referer),
      element(:Arg,req.arg),
      element(:Next,req.next) ])
  end
end

defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.Kicked do
  import XmlBuilder

  def generate(req) do
    element("cwmp:Kicked", [
      element(:Command,req.command),
      element(:Referer,req.referer),
      element(:Arg,req.arg),
      element(:Next,req.next) ])
  end
end

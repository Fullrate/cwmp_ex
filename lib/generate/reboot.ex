defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.Reboot do
  import XmlBuilder

  def generate(req) do
    element("cwmp:Reboot", [element(:CommandKey, req.commandkey)])
  end
end

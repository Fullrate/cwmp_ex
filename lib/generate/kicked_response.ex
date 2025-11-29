defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.KickedResponse do
  import XmlBuilder

  def generate(req) do
    element("cwmp:KickedResponse", [
      element(:NextURL,req.next_url) ])
  end
end

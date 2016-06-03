defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.InformResponse do
  import XmlBuilder

  def generate(req) do
    element("cwmp:InformResponse", [element(:MaxEnvelopes, req.max_envelopes)])
  end
end


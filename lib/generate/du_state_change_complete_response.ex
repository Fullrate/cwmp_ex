defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.DUStateChangeCompleteResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:DUStateChangeCompleteResponse", nil)
  end
end

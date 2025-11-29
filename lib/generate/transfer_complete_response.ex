defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.TransferCompleteResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:TransferCompleteResponse", nil)
  end

end


defimpl CWMP.Procol.Generate, for: CWMP.Protocol.Messages.CancelTransferResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:CancelTransferResponse", nil)
  end
end

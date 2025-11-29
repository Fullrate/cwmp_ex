defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.GetAllQueuedTransfers do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:GetAllQueuedTransfers", nil)
  end
end

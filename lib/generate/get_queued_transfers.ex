defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.GetQueuedTransfers do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:GetQueuedTransfers", nil)
  end
end


defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.AutonomousTransferCompleteResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:AutonomousTransferCompleteResponse", nil)
  end

end


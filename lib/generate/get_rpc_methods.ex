defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.GetRPCMethods do
  import XmlBuilder
  def generate(_req) do
    element("cwmp:GetRPCMethods", nil)
  end
end

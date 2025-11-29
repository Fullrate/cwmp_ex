defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.SetVouchersResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:SetVouchersResponse", nil)
  end
end


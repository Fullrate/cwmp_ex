defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.RequestDownloadResponse do
  import XmlBuilder

  def generate(_req) do
    element("cwmp:RequestDownloadResponse", nil)
  end
end

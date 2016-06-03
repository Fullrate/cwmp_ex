defmodule CWMP.Protocol.Generator.Messages.RequestDownloadResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    element("cwmp:RequestDownloadResponse", nil)
  end
end

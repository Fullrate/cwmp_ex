defmodule CWMP.Protocol.Generator.Messages.GetAllQueuedTransfers do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate do
    element("cwmp:GetAllQueuedTransfers", nil)
  end
end

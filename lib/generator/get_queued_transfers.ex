defmodule CWMP.Protocol.Generator.Messages.GetQueuedTransfers do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate do
    element('cwmp:GetQueuedTransfers', '')
  end
end


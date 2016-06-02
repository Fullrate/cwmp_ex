defmodule CWMP.Protocol.Generator.Messages.AutonomousTransferCompleteResponse do
  import XmlBuilder
  use CWMP.Protocol.GeneratorHelpers

  def generate do
    element("cwmp:AutonomousTransferCompleteResponse", nil)
  end

end


defmodule CWMP.Protocol.Generator.Messages.FactoryResetResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate do
    element("cwmp:FactoryResetResponse", nil)
  end
end

defmodule CWMP.Protocol.Generator.Messages.FactoryReset do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate do
    element("cwmp:FactoryReset", nil)
  end
end

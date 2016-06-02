defmodule CWMP.Protocol.Generator.Messages.ChangeDUStateResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate do
    element("cwmp:ChangeDUStateResponse", nil)
  end
end

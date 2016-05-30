defmodule CWMP.Protocol.Generator.Messages.RebootResponse do
  import XmlBuilder

  def generate() do
    element('cwmp:RebootResponse', '')
  end
end

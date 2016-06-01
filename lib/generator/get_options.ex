defmodule CWMP.Protocol.Generator.Messages.GetOptions do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    element('cwmp:GetOptions', [
      element(:OptionName, req.option_name)])
  end

end


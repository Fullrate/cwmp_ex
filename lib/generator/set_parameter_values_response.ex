defmodule CWMP.Protocol.Generator.Messages.SetParameterValuesResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    element("cwmp:SetParameterValuesResponse", [
      element(:Status, integerValue(req.status))])
  end

end


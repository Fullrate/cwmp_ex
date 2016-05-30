defmodule CWMP.Protocol.Generator.Messages.GetParameterNamesRequest do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    next_level = boolValue(req.next_level)
    element('cwmp:GetParameterNames', [element(:ParameterPath,req.parameter_path), element(:NextLevel,next_level)])
  end
end


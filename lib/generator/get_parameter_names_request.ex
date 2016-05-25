defmodule CWMP.Protocol.Generator.Messages.GetParameterNamesRequest do
  import XmlBuilder

  def generate(req) do
    next_level = case req.next_level do
      true -> "1"
      false -> "0"
      _ -> raise "Invalid value [#{req.next_level}] for next_level"
    end
    element('cwmp:GetParameterNames', [element(:ParameterPath,req.parameter_path), element(:NextLevel,next_level)])
  end
end


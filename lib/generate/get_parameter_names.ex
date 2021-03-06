defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.GetParameterNames do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    next_level = boolValue(req.next_level)
    element("cwmp:GetParameterNames", [element(:ParameterPath,req.parameter_path), element(:NextLevel,next_level)])
  end
end


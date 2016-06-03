defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.SetParameterValuesResponse do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    element("cwmp:SetParameterValuesResponse", [
      element(:Status, integerValue(req.status))])
  end

end


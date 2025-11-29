defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.GetOptions do
  import XmlBuilder

  def generate(req) do
    element("cwmp:GetOptions", [
      element(:OptionName, req.option_name)])
  end

end


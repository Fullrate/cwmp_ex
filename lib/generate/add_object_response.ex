defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.AddObjectResponse do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    instance_number = integerValue( req.instance_number, fn(x) -> x > 0 end)
    status = integerValue( req.status, fn(x) -> x in 0..1 end)
    element("cwmp:AddObjectResponse", [
      element(:InstanceNumber, instance_number),
      element(:Status, status) ] )
  end
end

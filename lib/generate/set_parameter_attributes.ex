defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.SetParameterAttributes do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    params=for p <- req.parameters, do: parameterAttributeStruct(p)
    element("cwmp:SetParameterAttributes", [
      element(:ParameterList,%{"SOAP-ENC:arrayType": "cwmp:SetParameterAttributesStruct[#{length(params)}]"},params)])
  end

  defp parameterAttributeStruct(param) do
    al=for p <- param.accesslist, do: element(:string, p)
    element(:SetParameterAttributesStruct, [
      element(:Name, param.name),
      element(:NotificationChange, boolValue(param.notification_change)),
      element(:Notification, to_string(param.notification)),
      element(:AccessListChange, boolValue(param.accesslist_change)),
      element(:AccessList, al)
    ])
  end
end


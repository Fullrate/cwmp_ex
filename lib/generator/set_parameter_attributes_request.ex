defmodule CWMP.Protocol.Generator.Messages.SetParameterAttributesRequest do
  import XmlBuilder

  def generate(req) do
    params=for p <- req.parameters, do: parameterAttributeStruct(p)
    element('cwmp:SetParameterAttributes', [element(:ParameterList,%{'SOAP-ENC:arrayType': 'cwmp:SetParameterAttributeStruct[#{length(params)}]'},params)])

  end

  defp parameterAttributeStruct(param) do
    nc = case param.notification_change do
      true -> "1"
      false -> "0"
    end
    alc = case param.accesslist_change do
      true -> "1"
      false -> "0"
    end
    al=for p <- param.accesslist, do: element(:string, p)
    element(:ParameterAttributeStruct, [
      element(:Name, param.name),
      element(:NotificationChange, nc),
      element(:Notification, to_string(param.notification)),
      element(:AccessListChange, alc),
      element(:AccessList, al)
    ])
  end
end


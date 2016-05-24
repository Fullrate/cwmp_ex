defmodule CWMP.Protocol.Generator.Messages.GetRPCMethodsRequest do
  import XmlBuilder

  def generate do
    element('cwmp:GetRPCMethods', '')
  end
end

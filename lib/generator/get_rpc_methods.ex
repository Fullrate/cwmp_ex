defmodule CWMP.Protocol.Generator.Messages.GetRPCMethods do
  import XmlBuilder

  def generate do
    element('cwmp:GetRPCMethods', '')
  end
end

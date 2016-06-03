defmodule CWMP.Protocol.Generator.Messages.GetRPCMethods do
  import XmlBuilder

  def generate(req) do
    element("cwmp:GetRPCMethods", nil)
  end
end

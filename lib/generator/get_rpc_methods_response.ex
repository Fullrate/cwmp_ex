defmodule CWMP.Protocol.Generator.Messages.GetRPCMethodsResponse do
  import XmlBuilder

  def generate(req) do
    mlist=for m <- req.methods, do: element(:string, m)
    element('cwmp:GetRPCMethodsResponse', [element(:MethodList, mlist)])
  end
end

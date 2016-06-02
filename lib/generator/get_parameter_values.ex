defmodule CWMP.Protocol.Generator.Messages.GetParameterValues do
  import XmlBuilder

  def generate(req) do
    params=for p <- req.parameters, do: element(p.type, p.name)
    element("cwmp:GetParameterValues", [element(:ParameterNames,params)])
  end
end


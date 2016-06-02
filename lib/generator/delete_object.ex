defmodule CWMP.Protocol.Generator.Messages.DeleteObject do
  import XmlBuilder

  def generate(req) do
    p=[]
    case String.last(req.object_name) do
      "." -> p = p ++ [element(:ObjectName, req.object_name)]
      _ -> raise "invalid objectname [#{req.object_name}] - must end in ."
    end
    if ( req.parameter_key != nil && String.length(req.parameter_key) > 0 ) do
      p = p ++ [element(:ParameterKey, req.parameter_key)]
    end
    element("cwmp:DeleteObject", p)
  end
end

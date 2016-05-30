defmodule CWMP.Protocol.Generator.Messages.AddObject do
  import XmlBuilder

  def generate(req) do
    p=[]
    case String.last(req.object_name) do
      "." -> p = p ++ [element('ObjectName', req.object_name)]
      _ -> raise "invalid object_name [#{req.object_name}] - must end in ."
    end
    if ( req.parameter_key != nil && String.length(req.parameter_key) > 0 ) do
      p = p ++ [element('ParameterKey', req.parameter_key)]
    end
    element('cwmp:AddObject', p)
  end
end

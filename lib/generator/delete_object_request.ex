defmodule CWMP.Protocol.Generator.Messages.DeleteObjectRequest do
  import XmlBuilder

  def generate(req) do
    p=[]
    case String.last(req.objectname) do
      "." -> p = p ++ [element('ObjectName', req.objectname)]
      _ -> raise "invalid objectname [#{req.objectname}] - must end in ."
    end
    if ( req.parameterkey != nil && String.length(req.parameterkey) > 0 ) do
      p = p ++ [element('ParameterKey', req.parameterkey)]
    end
    element('cwmp:DeleteObject', p)
  end
end

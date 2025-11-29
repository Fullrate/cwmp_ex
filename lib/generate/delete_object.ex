defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.DeleteObject do
  import XmlBuilder

  def generate(req) do
    if String.last(req.object_name) != ".", do: raise "invalid object_name [#{req.object_name}] - must end in ."
    p = [element(:ObjectName, req.object_name)]
    p = cond do
      req.parameter_key != nil && String.length(req.parameter_key) > 0 ->
        p ++ [element(:ParameterKey, req.parameter_key)]
      true -> p
    end
    element("cwmp:DeleteObject", p)
  end
end

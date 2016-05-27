defmodule CWMP.Protocol.Generator.Messages.DeleteObjectResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    element("cwmp:DeleteObjectResponse", [element("Status", integerValue(req.status, fn(x) -> x in 0..1 end))])
  end
end

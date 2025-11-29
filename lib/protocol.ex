defmodule CWMP.Protocol do
  defdelegate parse!(source), to: CWMP.Protocol.Parser
  defdelegate parse(source), to: CWMP.Protocol.Parser

  defdelegate generate!(head, req, version \\ "1-4"), to: CWMP.Protocol.Generator
  defdelegate generate(head, req, version \\ "1-4"), to: CWMP.Protocol.Generator
end

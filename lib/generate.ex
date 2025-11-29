defprotocol CWMP.Protocol.Generate do
  @doc "Generates XML for implemented Message types"
  def generate(req)
end


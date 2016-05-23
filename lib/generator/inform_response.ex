defmodule CWMP.Protocol.Generator.Messages.InformResponse do
  alias CWMP.Protocol.Messages.InformResponse

  def generate(resp) do
    ~s|<cwmp:InformResponse>
      <MaxEnvelopes>#{resp.max_envelopes}</MaxEnvelopes>
    </cwmp:InformResponse>|
  end
end


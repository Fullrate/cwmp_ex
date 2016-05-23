defmodule CWMP.Protocol.Generator.Messages.Header do
  alias CWMP.Protocol.Messages.Header

  def generate(msg) do
    ~s|<cwmp:ID SOAP-ENV:mustUnderstand="1">#{msg.id}</cwmp:ID>|
  end
end


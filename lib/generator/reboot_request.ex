defmodule CWMP.Protocol.Generator.Messages.RebootRequest do
  import XmlBuilder

  def generate(req) do
    element('cwmp:Reboot', [element('CommandKey',req.commandkey)])
  end
end

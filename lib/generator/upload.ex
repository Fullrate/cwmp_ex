defmodule CWMP.Protocol.Generator.Messages.Upload do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    Enum.map([:filetype, :url], fn(f) ->
      case Map.fetch(req, f) do
        {:ok,x} -> if x == nil do
          raise "key #{f} can not be nil"
        end
        {:error} -> raise "key #{f} must be set"
      end
    end)
    if not hd(to_char_list(req.filetype)) in [49,50,51,52,88] do
      raise "Invalid filetype"
    end
    element('cwmp:Upload', [
      element('CommandKey',req.commandkey),
      element('FileType',req.filetype),
      element('URL',req.url),
      element('Username',req.username),
      element('Password',req.password),
      element('DelaySeconds',req.delay_seconds)]
    )
  end
end

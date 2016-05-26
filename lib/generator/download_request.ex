defmodule CWMP.Protocol.Generator.Messages.DownloadRequest do
  import XmlBuilder

  def generate(req) do
    Enum.map([:filetype, :url, :filesize], fn(f) ->
      case Map.fetch(req, f) do
        {:ok,x} -> if x == nil do
          raise "key #{f} can not be nil"
        end
        {:error} -> raise "key #{f} must be set"
      end
    end)
    if not hd(to_char_list(req.filetype)) in [49,50,51,52,53,88] do
      raise "Invalid filetype"
    end
    filesize=case req.filesize do
      val when is_integer(val) and val >= 0 -> val
      val when is_integer(val) -> raise "Invalid filesize, can not be negative"
      x -> case Integer.parse(x) do
        {v,""} when v >= 0 -> v
        _ -> raise "Invalid filesize value"
      end
    end
    optionals=Enum.map(%{target_filename: "TargetFileName", success_url: "SuccessURL", failure_url: "FailureURL"}, fn {k, v} ->
      case Map.fetch(req, k) do
        {:ok,x} -> if x != nil && String.length(x) > 0 do
                      element(v, x)
                   else
                     nil
                   end
      end
    end)
    element('cwmp:Download', [
      element('CommandKey',req.commandkey),
      element('FileType',req.filetype),
      element('URL',req.url),
      element('Username',req.username),
      element('Password',req.password),
      element('FileSize',filesize),
      element('DelaySeconds',req.delay_seconds)] ++
      Enum.filter(optionals, fn(x) -> x != nil end)
    )
  end
end

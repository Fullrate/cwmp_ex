defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.Download do
  import XmlBuilder

  use CWMP.Protocol.GenerateHelpers

  def generate(req) do
    Enum.map([:filetype, :url, :filesize], fn(f) ->
      case Map.fetch(req, f) do
        {:ok,x} -> if x == nil do
          raise "key #{f} can not be nil"
        end
        {:error} -> raise "key #{f} must be set"
      end
    end)
    if not hd(to_charlist(req.filetype)) in [49,50,51,52,53,88] do
      raise "Invalid filetype"
    end
    filesize=integerValue(req.filesize, fn(x) -> x>=0 end)
    # setup optionals in the correct order? <- weird statement, but i want them in a specific order for good reason :P
    order = [:target_filename, :delay_seconds, :success_url, :failure_url]
    real_names = %{target_filename: "TargetFileName", delay_seconds: "DelaySeconds", success_url: "SuccessURL", failure_url: "FailureURL"}

    optionals=Enum.map( order , fn k ->
      cond do
        Map.has_key?(req, k) ->
          case Map.get(req,k) do
            nil ->
              nil
            v ->
              element(Map.get(real_names,k), v)
          end
        true ->
          nil
      end
    end)
    element("cwmp:Download", [
      element(:CommandKey,req.commandkey),
      element(:FileType,req.filetype),
      element(:URL,req.url),
      element(:Username,req.username),
      element(:Password,req.password),
      element(:FileSize,filesize)] ++
      Enum.filter(optionals, fn(x) -> x != nil end)
    )

  end
end

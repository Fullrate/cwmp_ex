defmodule CWMP.Protocol.Generator.Messages.TransferComplete do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    element("cwmp:TransferComplete", [
      element(:CommandKey, req.command_key),
      faultStruct(req.fault_struct),
      element(:StartTime, timeString(req.start_time)),
      element(:CompleteTime, timeString(req.complete_time))
    ])
  end

end


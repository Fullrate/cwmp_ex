defmodule CWMP.Protocol.Generator.Messages.TransferCompleteRequest do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    stime = timeString(req.start_time)
    ctime = timeString(req.complete_time)
    element('cwmp:TransferComplete', [
      element( :CommandKey, req.command_key ),
      faultStruct( req.fault_struct ),
      element( :StartTime, stime ),
      element( :CompleteTime, ctime )
    ])
  end

end


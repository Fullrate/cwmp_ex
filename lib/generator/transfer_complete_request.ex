defmodule CWMP.Protocol.Generator.Messages.TransferCompleteRequest do
  import XmlBuilder

  def generate(req) do
    stime = case Timex.format(req.start_time, "%FT%T%:z", :strftime) do
      {:ok, timestr} -> timestr
      _ -> raise "Invalid start_time structure"
    end
    ctime = case Timex.format(req.complete_time, "%FT%T%:z", :strftime) do
      {:ok, timestr} -> timestr
      _ -> raise "Invalid complete_time structure"
    end
    element('cwmp:TransferComplete', [
      element( :CommandKey, req.command_key ),
      faultStruct( req.fault_struct ),
      element( :StartTime, stime ),
      element( :CompleteTime, ctime )
    ])
  end

  defp faultStruct( fault ) do
    element( :FaultStruct, [ element( :FaultCode, fault.code ), element( :FaultString, fault.string ) ] )
  end

end


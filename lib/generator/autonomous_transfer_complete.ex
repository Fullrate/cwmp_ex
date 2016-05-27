defmodule CWMP.Protocol.Generator.Messages.AutonomousTransferCompleteRequest do
  import XmlBuilder
  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    stime = timeString( req.start_time )
    ctime = timeString( req.complete_time )
    id = boolValue( req.is_download )
    element('cwmp:AutonomousTransferComplete', [
      element( :AnnounceURL, req.announce_url ),
      element( :TransferURL, req.transfer_url ),
      element( :IsDownload, id ),
      element( :FileType, req.filetype ),
      element( :FileSize, req.filesize ),
      element( :TargetFileName, req.target_filename ),
      faultStruct( req.fault_struct ),
      element( :StartTime, stime ),
      element( :CompleteTime, ctime )
    ])
  end

end


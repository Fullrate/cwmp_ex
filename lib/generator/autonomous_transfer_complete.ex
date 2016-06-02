defmodule CWMP.Protocol.Generator.Messages.AutonomousTransferComplete do
  import XmlBuilder
  use CWMP.Protocol.GeneratorHelpers

  def generate(req) do
    element("cwmp:AutonomousTransferComplete", [
      element(:AnnounceURL, req.announce_url),
      element(:TransferURL, req.transfer_url),
      element(:IsDownload, boolValue(req.is_download)),
      element(:FileType, req.filetype),
      element(:FileSize, req.filesize),
      element(:TargetFileName, req.target_filename ),
      faultStruct( req.fault_struct ),
      element(:StartTime, timeString(req.start_time)),
      element(:CompleteTime, timeString(req.complete_time))
    ])
  end

end


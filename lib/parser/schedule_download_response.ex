defmodule CWMP.Protocol.Parser.Messages.ScheduleDownloadResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.ScheduleDownloadResponse

  def initial_acc do
    %ScheduleDownloadResponse{}
  end

end


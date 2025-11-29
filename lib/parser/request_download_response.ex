defmodule CWMP.Protocol.Parser.Messages.RequestDownloadResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.RequestDownloadResponse

  def initial_acc do
    %RequestDownloadResponse{}
  end

end


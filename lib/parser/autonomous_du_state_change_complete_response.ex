defmodule CWMP.Protocol.Parser.Messages.AutonomousDUStateChangeCompleteResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.AutonomousDUStateChangeCompleteResponse

  def initial_acc do
    %AutonomousDUStateChangeCompleteResponse{}
  end

end


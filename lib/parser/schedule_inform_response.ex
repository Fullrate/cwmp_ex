defmodule CWMP.Protocol.Parser.Messages.ScheduleInformResponse do
  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.ScheduleInformResponse

  def initial_acc do
    %ScheduleInformResponse{}
  end
end


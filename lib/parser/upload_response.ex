defmodule CWMP.Protocol.Parser.Messages.UploadResponse do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.UploadResponse

  def initial_acc do
    %UploadResponse{}
  end

  def end_element(state, ['Status']) do
    update_acc(state, fn cur -> %UploadResponse{cur | status: integerValue(state.last_text,fn(x) -> x in 0..1 end)} end)
  end

  def end_element(state, ['StartTime']) do
    update_acc(state, fn cur -> %UploadResponse{cur | start_time: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['CompleteTime']) do
    update_acc(state, fn cur -> %UploadResponse{cur | complete_time: datetimeStructure(state.last_text)} end)
  end

end


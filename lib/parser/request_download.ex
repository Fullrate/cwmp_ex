defmodule CWMP.Protocol.Parser.Messages.RequestDownload do

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.RequestDownload

  def initial_acc do
    %RequestDownload{}
  end

  def start_element(state, ['ArgStruct', 'FileTypeArg'], _attribs, _uri) do
    push_handler(state, CWMP.Protocol.Parser.Messages.ArgStruct)
  end

  def end_element(state, ['ArgStruct', 'FileTypeArg']) do
    update_acc(state, fn acc -> %RequestDownload{acc | filetype_arg: acc.filetype_arg ++ [state.last_acc]} end)
  end

  def end_element(state, ['FileType']) do
    update_acc(state, fn cur -> %RequestDownload{cur | filetype: state.last_text} end)
  end

end


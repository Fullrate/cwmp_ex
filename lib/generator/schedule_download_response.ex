defmodule CWMP.Protocol.Generator.Messages.ScheduleDownloadResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate do
    element('cwmp:ScheduleDownloadResponse', '')
  end
end

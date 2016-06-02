defmodule CWMP.Protocol.Generator.Messages.ScheduleInformResponse do
  import XmlBuilder

  use CWMP.Protocol.GeneratorHelpers

  def generate do
    element("cwmp:ScheduleInformResponse", nil)
  end
end


defmodule CWMP.Protocol.Parser.Messages.InformRequest do
  defmodule DeviceIdStruct do
    use CWMP.Protocol.ParserHelpers
    alias CWMP.Protocol.Messages.DeviceIdStruct

    def initial_acc do
      %DeviceIdStruct{}
    end

    def end_element(state, ['Manufacturer']) do
      update_acc(state, fn acc -> %DeviceIdStruct{acc | manufacturer: state.last_text} end)
    end

    def end_element(state, ['OUI']) do
      update_acc(state, fn acc -> %DeviceIdStruct{acc | oui: state.last_text} end)
    end

    def end_element(state, ['ProductClass']) do
      update_acc(state, fn acc -> %DeviceIdStruct{acc | product_class: state.last_text} end)
    end

    def end_element(state, ['SerialNumber']) do
      update_acc(state, fn acc -> %DeviceIdStruct{acc | serial_number: state.last_text} end)
    end
  end

  defmodule EventStruct do
    use CWMP.Protocol.ParserHelpers
    alias CWMP.Protocol.Messages.EventStruct

    def initial_acc do
      %EventStruct{}
    end

    def end_element(state, ['EventCode']) do
      update_acc(state, fn acc -> %EventStruct{acc | code: state.last_text} end)
    end

    def end_element(state, ['CommandKey']) do
      update_acc(state, fn acc -> %EventStruct{acc | command_key: state.last_text} end)
    end
  end

  use CWMP.Protocol.ParserHelpers
  alias CWMP.Protocol.Messages.InformRequest

  def initial_acc do
    %InformRequest{}
  end

  def start_element(state, ['DeviceId'], _attribs) do
    push_handler(state, DeviceIdStruct)
  end

  def start_element(state, ['EventStruct', 'Event'], _attribs) do
    push_handler(state, EventStruct)
  end

  def start_element(state, ['ParameterValueStruct', 'ParameterList'], _attribs) do
    push_handler(state, CWMP.Protocol.Parser.Messages.ParameterValueStruct)
  end

  def end_element(state, ['DeviceId']) do
    update_acc(state, fn acc -> %InformRequest{acc | device_id: state.last_acc} end)
  end

  def end_element(state, ['EventStruct', 'Event']) do
    update_acc(state, fn acc -> %InformRequest{acc | events: acc.events ++ [state.last_acc]} end)
  end

  def end_element(state, ['ParameterValueStruct', 'ParameterList']) do
    update_acc(state, fn acc -> %InformRequest{acc | parameters: acc.parameters ++ [state.last_acc]} end)
  end

  def end_element(state, ['MaxEnvelopes']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val > 0 -> update_acc(state, fn cur -> %InformRequest{cur | max_envelopes: val} end)
      _ -> raise "Invalid number of maximum envelopes"
    end
  end

  @accepted_time_formats ["{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}",
                          "{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}{Z:}",
                          "{YYYY}-{0M}-{0D}T{0h24}:{0m}:{0s}Z"]
  def end_element(state, ['CurrentTime']) do
    times = @accepted_time_formats
    |> Enum.map(&Timex.DateFormat.parse(state.last_text, &1))
    |> Enum.filter(fn
      {:ok, _} -> true
      _ -> false
    end)
    case times do
      [{:ok, val} | _] -> update_acc(state, fn cur -> %InformRequest{cur | current_time: val} end)
      _ -> raise "Current time '#{state.last_text}' has unacceptable format"
    end
  end

  def end_element(state, ['RetryCount']) do
    case Integer.parse(state.last_text) do
      {val, ""} when val >= 0 -> update_acc(state, fn cur -> %InformRequest{cur | retry_count: val} end)
      _ -> raise "Invalid retry count"
    end
  end
end


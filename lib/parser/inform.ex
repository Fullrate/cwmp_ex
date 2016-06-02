defmodule CWMP.Protocol.Parser.Messages.Inform do
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
  alias CWMP.Protocol.Messages.Inform

  def initial_acc do
    %Inform{}
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
    update_acc(state, fn acc -> %Inform{acc | device_id: state.last_acc} end)
  end

  def end_element(state, ['EventStruct', 'Event']) do
    update_acc(state, fn acc -> %Inform{acc | events: acc.events ++ [state.last_acc]} end)
  end

  def end_element(state, ['ParameterValueStruct', 'ParameterList']) do
    update_acc(state, fn acc -> %Inform{acc | parameters: acc.parameters ++ [state.last_acc]} end)
  end

  def end_element(state, ['MaxEnvelopes']) do
    update_acc(state, fn cur -> %Inform{cur | max_envelopes: integerValue(state.last_text, fn(x) -> x > 0 end)} end)
  end

  def end_element(state, ['CurrentTime']) do
    update_acc(state, fn cur -> %Inform{cur | current_time: datetimeStructure(state.last_text)} end)
  end

  def end_element(state, ['RetryCount']) do
    update_acc(state, fn cur -> %Inform{cur | retry_count: integerValue(state.last_text, fn(x) -> x >= 0 end)} end)
  end
end


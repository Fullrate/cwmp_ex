defmodule CWMP.Protocol.Parser.HelperTest do
  use ExUnit.Case, async: true
  use Timex
  import CWMP.Protocol.ParserHelpers

  @datetimesamples [
    "2016-06-15T10:12:03",
    "2016-06-15T10:12:03Z",
    "2016-06-15T12:12:03+02:00",
    "2016-06-15T10:12:03.000",
    "2016-06-15T10:12:03.000Z",
    "2016-06-15T12:12:03.000+02:00",
  ]
  @datetimetarget Timex.datetime({{2016, 6, 15}, {10, 12, 03}})

  test "Parses time correctly" do
    Enum.each(@datetimesamples, fn s ->
      assert(datetimeStructure(s) |> Timex.DateTime.universal == @datetimetarget)
    end)
  end
end

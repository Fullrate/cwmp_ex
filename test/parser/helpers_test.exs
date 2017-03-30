defmodule CWMP.Protocol.Parser.HelperTest do
  use ExUnit.Case, async: true
  import CWMP.Protocol.ParserHelpers

  @datetimesamples %{
    "2016-06-15T10:12:03" => %DateTime{year: 2016, month: 6, day: 15, hour: 10, minute: 12, second: 03, utc_offset: 0, microsecond: {0, 0}, time_zone: "Etc/UTC", zone_abbr: "UTC", std_offset: 0},
    "2016-06-15T10:12:03Z" =>  %DateTime{year: 2016, month: 6, day: 15, hour: 10, minute: 12, second: 03, utc_offset: 0, microsecond: {0, 0}, time_zone: "Etc/UTC", zone_abbr: "UTC", std_offset: 0},
    "2016-06-15T12:12:03+02:00" => %DateTime{year: 2016, month: 6, day: 15, hour: 10, minute: 12, second: 03, utc_offset: 7200, microsecond: {0, 0}, time_zone: "Etc/UTC", zone_abbr: "UTC", std_offset: 0},
    "2016-06-15T10:12:03.000" => %DateTime{year: 2016, month: 6, day: 15, hour: 10, minute: 12, second: 03, utc_offset: 0, microsecond: {0, 3}, time_zone: "Etc/UTC", zone_abbr: "UTC", std_offset: 0},
    "2016-06-15T10:12:03.000Z" => %DateTime{year: 2016, month: 6, day: 15, hour: 10, minute: 12, second: 03, utc_offset: 0, microsecond: {0, 3}, time_zone: "Etc/UTC", zone_abbr: "UTC", std_offset: 0},
    "2016-06-15T12:12:03.000+02:00" => %DateTime{year: 2016, month: 6, day: 15, hour: 10, minute: 12, second: 03, utc_offset: 7200, microsecond: {0, 3}, time_zone: "Etc/UTC", zone_abbr: "UTC", std_offset: 0}
  }

  test "Parses time correctly" do
    Enum.each( @datetimesamples, fn {ds, exp_ds} ->
      assert( datetimeStructure(ds) == exp_ds )
    end)
  end
end

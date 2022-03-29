defmodule CWMP.Protocol.Parser.DateTimeTest do
  use ExUnit.Case, async: true

  @iso_samples %{
    "2022-01-01T12:12:00Z" => %DateTime{
      year: 2022,
      month: 1,
      day: 1,
      zone_abbr: "Z",
      hour: 12,
      minute: 12,
      second: 0,
      microsecond: {0, 0},
      utc_offset: 0,
      std_offset: 0,
      time_zone: ""
    },
    "2001-09-11T12:12:00Z" => %DateTime{
      year: 2001,
      month: 9,
      day: 11,
      zone_abbr: "Z",
      hour: 12,
      minute: 12,
      second: 0,
      microsecond: {0, 0},
      utc_offset: 0,
      std_offset: 0,
      time_zone: ""
    }
  }

  @relative_samples %{
    "0001-01-01T12:12:00Z" => %DateTime{
      year: 1,
      month: 1,
      day: 1,
      zone_abbr: "Z",
      hour: 12,
      minute: 12,
      second: 0,
      microsecond: {0, 0},
      utc_offset: 0,
      std_offset: 0,
      time_zone: ""
    },
    "0001-01-04T14:14:00" => %DateTime{
      year: 1,
      month: 1,
      day: 4,
      zone_abbr: "Z",
      hour: 14,
      minute: 14,
      second: 0,
      microsecond: {0, 0},
      utc_offset: 0,
      std_offset: 0,
      time_zone: ""
    }
  }

  @unparseable_samples [
    "0001-Z",
    "0",
    ""
  ]

  @unknown_datetime %DateTime{
    year: 1,
    month: 1,
    day: 1,
    zone_abbr: "Z",
    hour: 0,
    minute: 0,
    second: 0,
    microsecond: {0, 0},
    utc_offset: 0,
    std_offset: 0,
    time_zone: ""
  }

  test "parse iso dates" do
    for {s, r} <- @iso_samples do
      assert(DateTime.compare(CWMP.Protocol.ParserHelpers.required_datetimeStructure(s), r))
    end
  end

  test "parse unparseable required" do
    for s <- @unparseable_samples do
      assert_raise(
        RuntimeError,
        fn ->
          CWMP.Protocol.ParserHelpers.required_datetimeStructure(s)
        end
      )
    end
  end

  test "parse relative dates" do
    for {s, r} <- @relative_samples do
      assert(DateTime.compare(CWMP.Protocol.ParserHelpers.datetimeStructure(s), r))
    end
  end

  test "parse unparseable dates" do
    for s <- @unparseable_samples do
      assert(
        DateTime.compare(CWMP.Protocol.ParserHelpers.datetimeStructure(s), @unknown_datetime)
      )
    end
  end
end

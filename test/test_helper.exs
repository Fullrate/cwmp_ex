ExUnit.start()

defmodule TestHelpers do

  def generate_datetime( {{day, month, year}, {hour, minute, second}}, timezone \\ "Etc/UTC", zone_abbr \\ "UTC", utc_offset \\ 0 ) do
    %DateTime{year: year, month: month, day: day, hour: hour, minute: minute, second: second, utc_offset: utc_offset, microsecond: {0, 0}, time_zone: timezone, zone_abbr: zone_abbr, std_offset: 0}
  end

end

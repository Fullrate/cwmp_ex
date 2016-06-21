defmodule CWMP.Protocol.Generator.DownloadResponseTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:DownloadResponse>
\t\t\t<Status>0</Status>
\t\t\t<StartTime>2015-01-19T23:08:24+00:00</StartTime>
\t\t\t<CompleteTime>2015-01-19T23:18:24+00:00</CompleteTime>
\t\t</cwmp:DownloadResponse>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates full Download request" do
    assert(CWMP.Protocol.Generator.generate!(%CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},%CWMP.Protocol.Messages.DownloadResponse{status: "0",
      start_time: %Timex.DateTime{calendar: :gregorian,
          day: 19, hour: 23, minute: 8, month: 1, millisecond: 0, second: 24,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015},
      complete_time: %Timex.DateTime{calendar: :gregorian,
          day: 19, hour: 23, minute: 18, month: 1, millisecond: 0, second: 24,
          timezone: %Timex.TimezoneInfo{abbreviation: "UTC", from: :min,
            full_name: "UTC", offset_std: 0, offset_utc: 0, until: :max}, year: 2015}}) == @sample)
  end

end

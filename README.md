# CWMP.Protocol #

Parses and Generates XML conforming to the CWMP protocol

## Introduction ##

The CWMP protocol is basically just a bunch of SOAP actions. The hassle
is always to get this right. cwmp_ex tries to get it right.

## Parsing ##

In order to parse a CWMP command into an struct all you have to to is had the parse
the raw xml document usually from some HTTP content, and it will return a usable
structure.

```ruby

doc="""
<SOAP-ENV:Envelope
    xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
    <SOAP-ENV:Header>
      <cwmp:ID SOAP-ENV:mustUnderstand="1">API_aa0642e34b23820801e7642ad7cb536c</cwmp:ID>
    </SOAP-ENV:Header>
    <SOAP-ENV:Body>
      <cwmp:AddObject>
        <ObjectName>Device.Test.</ObjectName>
        <ParameterKey>ParamKey</ParameterKey>
      </cwmp:AddObject>
    </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
"""

CWMP.Protocol.Parser.parse(body)

%{entries: [%CWMP.Protocol.Messages.AddObject{object_name: "Device.Test.",
    parameter_key: "ParamKey"}],
  header: %CWMP.Protocol.Messages.Header{hold_requests: false,
   id: "API_aa0642e34b23820801e7642ad7cb536c", no_more_requests: false,
   session_timeout: 30}}

```

## Generating ##

When generating, you just assemble a header structure and an body structure, to match
the Header and Body part of the SOAP envelope, and ask
the generator to generate the XML, and you have something that can go on the wire.

```ruby

header=%CWMP.Protocol.Messages.Header{id: "50"}
body=%CWMP.Protocol.Messages.AddObject{object_name: "Device.Test.",
    parameter_key: "ParamKey"}

CWMP.Protocol.Generator.generate(header, body)

"<SOAP-ENV:Envelope xmlns:SOAP-ENC=\"http://schemas.xmlsoap.org/soap/encoding/\" xmlns:SOAP-ENV=\"http://schemas.xmlsoap.org/soap/envelope/\" xmlns:cwmp=\"urn:dslforum-org:cwmp-1-4\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n\t<SOAP-ENV:Header>\n\t\t<cwmp:ID SOAP-ENV:mustUnderstand=\"1\">50</cwmp:ID>\n\t</SOAP-ENV:Header>\n\t<SOAP-ENV:Body>\n\t\t<cwmp:AddObject>\n\t\t\t<ObjectName>Device.Test.</ObjectName>\n\t\t\t<ParameterKey>ParamKey</ParameterKey>\n\t\t</cwmp:AddObject>\n\t</SOAP-ENV:Body>\n</SOAP-ENV:Envelope>"

## Installation ##

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add cwmp_ex to your list of dependencies in `mix.exs`:

        def deps do
          [{:cwmp_ex, "~> 0.1.0"}]
        end

  2. Ensure cwmp_ex is started before your application:

        def application do
          [applications: [:cwmp_ex]]
        end


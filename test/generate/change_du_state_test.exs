defmodule CWMP.Protocol.Generator.ChangeDUStateTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:ChangeDUState>
\t\t\t<CommandKey>CommandKey</CommandKey>
\t\t\t<Operations>
\t\t\t\t<InstallOpStruct>
\t\t\t\t\t<URL>http://example.com/url</URL>
\t\t\t\t\t<UUID>bla-foo-abcd-1234</UUID>
\t\t\t\t\t<Username>user</Username>
\t\t\t\t\t<Password>pass</Password>
\t\t\t\t\t<ExecutionEnvRef>foo</ExecutionEnvRef>
\t\t\t\t</InstallOpStruct>
\t\t\t</Operations>
\t\t</cwmp:ChangeDUState>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates ChangeDUState request, one install" do
    assert(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.ChangeDUState{
        commandkey: "CommandKey",
        operations: [
          %CWMP.Protocol.Messages.InstallOpStruct{
            url: "http://example.com/url",
            uuid: "bla-foo-abcd-1234",
            username: "user",
            password: "pass",
            execution_env_ref: "foo"
          }]
      },"1-0") == @sample)
  end

  @sample2 ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-4" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
\t<SOAP-ENV:Header>
\t\t<cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
\t</SOAP-ENV:Header>
\t<SOAP-ENV:Body>
\t\t<cwmp:ChangeDUState>
\t\t\t<CommandKey>CommandKey</CommandKey>
\t\t\t<Operations>
\t\t\t\t<InstallOpStruct>
\t\t\t\t\t<URL>http://example.com/url</URL>
\t\t\t\t\t<UUID>bla-foo-abcd-1234</UUID>
\t\t\t\t\t<Username>user</Username>
\t\t\t\t\t<Password>pass</Password>
\t\t\t\t\t<ExecutionEnvRef>foo</ExecutionEnvRef>
\t\t\t\t</InstallOpStruct>
\t\t\t\t<UpdateOpStruct>
\t\t\t\t\t<URL>http://example.com/url</URL>
\t\t\t\t\t<UUID>bla-foo-abcd-1234</UUID>
\t\t\t\t\t<Username>user</Username>
\t\t\t\t\t<Password>pass</Password>
\t\t\t\t\t<Version>v2.0</Version>
\t\t\t\t</UpdateOpStruct>
\t\t\t\t<UninstallOpStruct>
\t\t\t\t\t<URL>http://example.com/url</URL>
\t\t\t\t\t<UUID>bla-foo-abcd-1234</UUID>
\t\t\t\t\t<ExecutionEnvRef>foo</ExecutionEnvRef>
\t\t\t\t</UninstallOpStruct>
\t\t\t</Operations>
\t\t</cwmp:ChangeDUState>
\t</SOAP-ENV:Body>
</SOAP-ENV:Envelope>|

  test "generates ChangeDUState request, one of each" do
    assert(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.ChangeDUState{
        commandkey: "CommandKey",
        operations: [
          %CWMP.Protocol.Messages.InstallOpStruct{
            url: "http://example.com/url",
            uuid: "bla-foo-abcd-1234",
            username: "user",
            password: "pass",
            execution_env_ref: "foo"},
          %CWMP.Protocol.Messages.UpdateOpStruct{
            url: "http://example.com/url",
            uuid: "bla-foo-abcd-1234",
            username: "user",
            password: "pass",
            version: "v2.0"},
          %CWMP.Protocol.Messages.UninstallOpStruct{
            url: "http://example.com/url",
            uuid: "bla-foo-abcd-1234",
            execution_env_ref: "foo"}
        ]}) == @sample2)
  end

  test "raise, ChangeDUState, invalid op" do
    assert(catch_error(CWMP.Protocol.Generator.generate!(
      %CWMP.Protocol.Messages.Header{id: "API_69412286f02e475b44783c61972f0a91"},
      %CWMP.Protocol.Messages.ChangeDUState{
        commandkey: "CommandKey",
        operations: [nil]})) == %RuntimeError{message: "Undefined ChangeDUState Operation Structure"})
  end

end

defmodule CWMP.Protocol.Generator.ChangeDUStateTest do
  use ExUnit.Case, async: true

  @sample ~s|<SOAP-ENV:Envelope xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cwmp="urn:dslforum-org:cwmp-1-0" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:ChangeDUState>
      <CommandKey>CommandKey</CommandKey>
      <Operations>
        <InstallOpStruct>
          <URL>http://example.com/url</URL>
          <UUID>bla-foo-abcd-1234</UUID>
          <Username>user</Username>
          <Password>pass</Password>
          <ExecutionEnvRef>foo</ExecutionEnvRef>
        </InstallOpStruct>
      </Operations>
    </cwmp:ChangeDUState>
  </SOAP-ENV:Body>
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
  <SOAP-ENV:Header>
    <cwmp:ID SOAP-ENV:mustUnderstand="1">API_69412286f02e475b44783c61972f0a91</cwmp:ID>
  </SOAP-ENV:Header>
  <SOAP-ENV:Body>
    <cwmp:ChangeDUState>
      <CommandKey>CommandKey</CommandKey>
      <Operations>
        <InstallOpStruct>
          <URL>http://example.com/url</URL>
          <UUID>bla-foo-abcd-1234</UUID>
          <Username>user</Username>
          <Password>pass</Password>
          <ExecutionEnvRef>foo</ExecutionEnvRef>
        </InstallOpStruct>
        <UpdateOpStruct>
          <URL>http://example.com/url</URL>
          <UUID>bla-foo-abcd-1234</UUID>
          <Username>user</Username>
          <Password>pass</Password>
          <Version>v2.0</Version>
        </UpdateOpStruct>
        <UninstallOpStruct>
          <URL>http://example.com/url</URL>
          <UUID>bla-foo-abcd-1234</UUID>
          <ExecutionEnvRef>foo</ExecutionEnvRef>
        </UninstallOpStruct>
      </Operations>
    </cwmp:ChangeDUState>
  </SOAP-ENV:Body>
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

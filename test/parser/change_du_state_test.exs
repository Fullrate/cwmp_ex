defmodule CWMP.Protocol.Parser.ChangeDUStateTest do
  use ExUnit.Case, async: true

  @sample """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:ChangeDUState>
                        <CommandKey>cmdkey</CommandKey>
                        <Operations>
                                <InstallOpStruct>
                                        <URL>http://example.com/url</URL>
                                        <UUID>some-uuid</UUID>
                                        <Username>user</Username>
                                        <Password>pass</Password>
                                        <ExecutionEnvRef>env</ExecutionEnvRef>
                                </InstallOpStruct>
                        </Operations>
                </cwmp:ChangeDUState>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample_result {:ok,%{entries: [%CWMP.Protocol.Messages.ChangeDUState{
        commandkey: "cmdkey",
        operations: [
          %CWMP.Protocol.Messages.InstallOpStruct{
            url: "http://example.com/url",
            uuid: "some-uuid",
            username: "user",
            password: "pass",
            execution_env_ref: "env"}]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50",
      session_timeout: 30, no_more_requests: false}}}

  test "parses ChangeDUState request, one install" do
    assert(CWMP.Protocol.Parser.parse(@sample) == @sample_result)
  end

  @sample2 """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:ChangeDUState>
                        <CommandKey>cmdkey</CommandKey>
                        <Operations>
                                <InstallOpStruct>
                                        <URL>http://example.com/url</URL>
                                        <UUID>some-uuid</UUID>
                                        <Username>user</Username>
                                        <Password>pass</Password>
                                        <ExecutionEnvRef>env</ExecutionEnvRef>
                                </InstallOpStruct>
                                <UninstallOpStruct>
                                        <URL>http://example.com/url</URL>
                                        <UUID>some-uuid</UUID>
                                        <ExecutionEnvRef>env</ExecutionEnvRef>
                                </UninstallOpStruct>
                        </Operations>
                </cwmp:ChangeDUState>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample2_result {:ok,%{entries: [%CWMP.Protocol.Messages.ChangeDUState{
        commandkey: "cmdkey",
        operations: [
          %CWMP.Protocol.Messages.InstallOpStruct{
            url: "http://example.com/url",
            uuid: "some-uuid",
            username: "user",
            password: "pass",
            execution_env_ref: "env"},
          %CWMP.Protocol.Messages.UninstallOpStruct{
            url: "http://example.com/url",
            uuid: "some-uuid",
            execution_env_ref: "env"}
        ]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50",
      session_timeout: 30, no_more_requests: false}}}

  test "parses ChangeDUState request, one install, one uninstall" do
    assert(CWMP.Protocol.Parser.parse(@sample2) == @sample2_result)
  end

  @sample3 """
<SOAP-ENV:Envelope xmlns:SOAP-ENV="http://schemas.xmlsoap.org/soap/envelope/" xmlns:SOAP-ENC="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:cwmp="urn:dslforum-org:cwmp-1-0">
        <SOAP-ENV:Header>
                <cwmp:ID SOAP-ENV:mustUnderstand="1">50</cwmp:ID>
        </SOAP-ENV:Header>
        <SOAP-ENV:Body>
                <cwmp:ChangeDUState>
                        <CommandKey>cmdkey</CommandKey>
                        <Operations>
                                <InstallOpStruct>
                                        <URL>http://example.com/url</URL>
                                        <UUID>some-uuid</UUID>
                                        <Username>user</Username>
                                        <Password>pass</Password>
                                        <ExecutionEnvRef>env</ExecutionEnvRef>
                                </InstallOpStruct>
                                <UpdateOpStruct>
                                        <URL>http://example.com/url</URL>
                                        <UUID>some-uuid</UUID>
                                        <Username>user</Username>
                                        <Password>pass</Password>
                                        <Version>v2.0</Version>
                                </UpdateOpStruct>
                                <UninstallOpStruct>
                                        <URL>http://example.com/url</URL>
                                        <UUID>some-uuid</UUID>
                                        <ExecutionEnvRef>env</ExecutionEnvRef>
                                </UninstallOpStruct>
                        </Operations>
                </cwmp:ChangeDUState>
        </SOAP-ENV:Body>
</SOAP-ENV:Envelope>
  """

  @sample3_result {:ok,%{entries: [%CWMP.Protocol.Messages.ChangeDUState{
        commandkey: "cmdkey",
        operations: [
          %CWMP.Protocol.Messages.InstallOpStruct{
            url: "http://example.com/url",
            uuid: "some-uuid",
            username: "user",
            password: "pass",
            execution_env_ref: "env"},
          %CWMP.Protocol.Messages.UpdateOpStruct{
            url: "http://example.com/url",
            uuid: "some-uuid",
            username: "user",
            password: "pass",
            version: "v2.0"},
          %CWMP.Protocol.Messages.UninstallOpStruct{
            url: "http://example.com/url",
            uuid: "some-uuid",
            execution_env_ref: "env"}
        ]}],
    header: %CWMP.Protocol.Messages.Header{hold_requests: false, id: "50",
      session_timeout: 30, no_more_requests: false}}}

  test "parses ChangeDUState request, one of each" do
    assert(CWMP.Protocol.Parser.parse(@sample3) == @sample3_result)
  end

end

defimpl CWMP.Protocol.Generate, for: CWMP.Protocol.Messages.ChangeDUState do
  import XmlBuilder

  def generate(req) do
    operations=for op <- req.operations, do: generateOperation(op)
    element("cwmp:ChangeDUState", [
      element(:CommandKey, req.commandkey),
      element(:Operations, operations) ])
  end

  # Based on the type of op, we create suitable elements
  defp generateOperation(op) do
    case op do
      %CWMP.Protocol.Messages.InstallOpStruct{url: url, uuid: uuid, username: user, password: pass, execution_env_ref: eer} -> element(:InstallOpStruct,[
        element(:URL,url),
        element(:UUID,uuid),
        element(:Username,user),
        element(:Password,pass),
        element(:ExecutionEnvRef,eer)])
      %CWMP.Protocol.Messages.UpdateOpStruct{url: url, uuid: uuid, username: user, password: pass, version: ver} -> element(:UpdateOpStruct,[
        element(:URL,url),
        element(:UUID,uuid),
        element(:Username,user),
        element(:Password,pass),
        element(:Version,ver)])
      %CWMP.Protocol.Messages.UninstallOpStruct{url: url, uuid: uuid, execution_env_ref: eer} -> element(:UninstallOpStruct,[
        element(:URL,url),
        element(:UUID,uuid),
        element(:ExecutionEnvRef,eer)])
      _ -> raise "Undefined ChangeDUState Operation Structure"
    end
  end

end

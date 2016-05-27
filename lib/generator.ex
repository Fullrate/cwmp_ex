defmodule CWMP.Protocol.Generator do
  import XmlBuilder

  @moduledoc """

  Generates XML messages from elixir structures

  """
  def inform_response(header, resp) do
    envelope(header,CWMP.Protocol.Generator.Messages.InformResponse.generate(resp))
  end

  def get_parameter_values(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetParameterValuesRequest.generate(req))
  end

  def get_parameter_names(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetParameterNamesRequest.generate(req))
  end

  def set_parameter_values(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.SetParameterValuesRequest.generate(req))
  end

  def get_parameter_attributes(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetParameterAttributesRequest.generate(req))
  end

  def set_parameter_attributes(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.SetParameterAttributesRequest.generate(req))
  end

  def get_rpc_methods(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetRPCMethodsRequest.generate);
  end

  def add_object(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.AddObjectRequest.generate(req));
  end

  def add_object_response(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.AddObjectResponse.generate(req));
  end

  def delete_object(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.DeleteObjectRequest.generate(req));
  end

  def download(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.DownloadRequest.generate(req));
  end

  def reboot(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.RebootRequest.generate(req));
  end


  def inform(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.InformRequest.generate(req));
  end

  def transfer_complete(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.TransferCompleteRequest.generate(req));
  end

  def autonomous_transfer_complete(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.AutonomousTransferCompleteRequest.generate(req));
  end

  defp envelope(head,body) do
    header=CWMP.Protocol.Generator.Messages.Header.generate(head)
    element('SOAP-ENV:Envelope',
      %{
        'xmlns:SOAP-ENV': "http://schemas.xmlsoap.org/soap/envelope/",
        'xmlns:SOAP-ENC': "http://schemas.xmlsoap.org/soap/encoding/",
        'xmlns:xsi': "http://www.w3.org/2001/XMLSchema-instance",
        'xmlns:xsd': "http://www.w3.org/2001/XMLSchema",
        'xmlns:cwmp': "urn:dslforum-org:cwmp-1-0"
      },
      [ element('SOAP-ENV:Header', [header]), element('SOAP-ENV:Body', [body]) ] ) |> generate;
  end
end

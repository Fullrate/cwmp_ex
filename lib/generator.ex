defmodule CWMP.Protocol.Generator do
  import XmlBuilder

  @moduledoc """

  Generates XML messages from elixir structures

  """
  def inform_response(header, resp) do
    envelope(header,CWMP.Protocol.Generator.Messages.InformResponse.generate(resp))
  end

  def get_parameter_values(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetParameterValues.generate(req))
  end

  def get_parameter_values_response(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetParameterValuesResponse.generate(req))
  end

  def get_parameter_names(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetParameterNames.generate(req))
  end

  def get_parameter_names_response(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetParameterNamesResponse.generate(req))
  end

  def set_parameter_values(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.SetParameterValues.generate(req))
  end

  def set_parameter_values_response(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.SetParameterValuesResponse.generate(req))
  end

  def get_parameter_attributes(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetParameterAttributes.generate(req))
  end

  def get_parameter_attributes_response(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetParameterAttributesResponse.generate(req))
  end

  def set_parameter_attributes(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.SetParameterAttributes.generate(req))
  end

  def set_parameter_attributes_response(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.SetParameterAttributesResponse.generate)
  end

  def get_rpc_methods(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetRPCMethods.generate);
  end

  def get_rpc_methods_response(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetRPCMethodsResponse.generate(req));
  end

  def add_object(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.AddObject.generate(req));
  end

  def add_object_response(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.AddObjectResponse.generate(req));
  end

  def delete_object(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.DeleteObject.generate(req));
  end

  def delete_object_response(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.DeleteObjectResponse.generate(req));
  end

  def download(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.Download.generate(req));
  end

  def download_response(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.DownloadResponse.generate(req));
  end

  def reboot(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.Reboot.generate(req));
  end

  def reboot_response(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.RebootResponse.generate);
  end

  def inform(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.Inform.generate(req));
  end

  def transfer_complete(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.TransferComplete.generate(req));
  end

  def transfer_complete_response(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.TransferCompleteResponse.generate);
  end

  def autonomous_transfer_complete(header, req) do
    envelope(header,CWMP.Protocol.Generator.Messages.AutonomousTransferComplete.generate(req));
  end

  def autonomous_transfer_complete_response(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.AutonomousTransferCompleteResponse.generate);
  end

  # optionals
  def get_queued_transfers(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetQueuedTransfers.generate);
  end

  def get_queued_transfers_response(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetQueuedTransfersResponse.generate(req));
  end

  def schedule_inform(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.ScheduleInform.generate(req));
  end

  def schedule_inform_response(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.ScheduleInformResponse.generate);
  end

  def set_vouchers(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.SetVouchers.generate(req));
  end

  def set_vouchers_response(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.SetVouchersResponse.generate);
  end

  def get_options(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetOptions.generate(req));
  end

  def get_options_response(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetOptionsResponse.generate(req));
  end

  def upload(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.Upload.generate(req));
  end

  def upload_response(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.UploadResponse.generate(req));
  end

  def factory_reset(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.FactoryReset.generate);
  end

  def factory_reset_response(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.FactoryResetResponse.generate);
  end

  def get_all_queued_transfers(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetAllQueuedTransfers.generate);
  end

  def get_all_queued_transfers_response(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.GetAllQueuedTransfersResponse.generate(req));
  end

  def schedule_download(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.ScheduleDownload.generate(req));
  end

  def schedule_download_response(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.ScheduleDownloadResponse.generate);
  end

  def cancel_transfer(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.CancelTransfer.generate(req));
  end

  def cancel_transfer_response(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.CancelTransferResponse.generate);
  end

  def change_du_state(header,req) do
    envelope(header,CWMP.Protocol.Generator.Messages.ChangeDUState.generate(req));
  end

  def change_du_state_response(header) do
    envelope(header,CWMP.Protocol.Generator.Messages.ChangeDUStateResponse.generate);
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

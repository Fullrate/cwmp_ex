defmodule CWMP.Protocol.Messages.KeyInfoStruct do
  @derive [Poison.Encoder]

  @moduledoc """

  This structure is for the SetVouchers method
  and conains the information needed to build an XML-Signature
  document containing options

  """
  defstruct key_value: %CWMP.Protocol.Messages.KeyValueStruct{},
            x509_data: %CWMP.Protocol.Messages.X509DataStruct{}
end

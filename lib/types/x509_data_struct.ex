defmodule CWMP.Protocol.Messages.X509DataStruct do
  @derive [Poison.Encoder]

  @moduledoc """

  This structure is for the SetVouchers method
  and is to be contains within a KeyInfoStruct.

  """
  defstruct issuer_serial:  %CWMP.Protocol.Messages.X509IssuerSerialStruct{},
            subject_name:   nil, # string
            certificates:   [] # string[] - base64 encoded x509 certificates
end

defmodule CWMP.Protocol.Messages.XMLSignatureStruct do
  @derive [Poison.Encoder]

  @moduledoc """

  This structure is for the SetVouchers method
  and conains the information needed to build an XML-Signature
  document containing options

  """
  defstruct signature_value: nil, # string
            key_info:        %CWMP.Protocol.Messages.KeyInfoStruct{},
            options:         []
end

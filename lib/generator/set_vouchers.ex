defmodule CWMP.Protocol.Generator.Messages.SetVouchers do
  import XmlBuilder
  use CWMP.Protocol.GeneratorHelpers

  @moduledoc """

    The SetVouchers feature involves an OptionStruct and
    XML-Signature format. The XML-Signature format will
    require its own XMLSignatureStruct to define signatures
    and Certificates aso needed to generate the XML-Signature
    format.

    First generate some options, based on the options array in the req

    Generate the XML-Signature document, encompassing the
    options generataed above.

    We have to actually XML generate the XML-Signature structure
    and base64 encode it into the SetVouchers command.
    This version of SetVouchers will only be able to
    set one Voucher at the time, since a voucher can
    contain multiple options, this should be enough.

    If multiple vouchers in the same SetVouchers is to be
    supported future versions, it would only make sense
    if we had multiple signatures. Since the method is
    DEPRECATED in the 1.4 spec, this is unlikely to ever
    happen.

    The passes req is a list of signatures, each containing
    the data needed to generate the actual XML-Signature document
    but also a list of options pr. signature.

    CWMP.Protocol.Messages.XMLSignatureStruct
    CWMP.Protocol.Messages.OptionStruct

  """


  @doc """

    Generates an XML-Signature structure based on the passed
    CWMP.Protocol.Messages.SignatureStruct parameter.

    XML-Signature doc is here
    https://www.w3.org/TR/2002/REC-xmldsig-core-20020212/xmldsig-core-schema.xsd

  """
  def generate(req) do
    signatures=for s <- req, do: generateSignature(s)
    signatures_xml=for s <- signatures, do: XmlBuilder.generate(s)
    signatures_base64=for s <- signatures_xml, do: Base.encode64(s)
    signatures_wrapped=for s <- signatures_base64, do: element(:base64,s)
    element("cwmp:SetVouchers", [element(:VoucherList,%{"SOAP-ENC:arrayType": "base64[#{length(signatures_wrapped)}]"},signatures_wrapped)])
  end

  defp generateSignature(signature) do
    if length(signature.options) < 1 do
      raise "Some options must be set"
    end
    element(:Signature, %{xmlns: "http://www.w3.org/2000/09/xmldsig#"}, [
      generateSignedInfo(signature.options)] ++ [
      element(:SignatureValue, signature.signature_value),
      element(:KeyInfo, [
        element(:KeyValue, [
          element(:DSAKeyValue, [
            element(:P, signature.key_info.key_value.dsa_p),
            element(:Q, signature.key_info.key_value.dsa_q),
            element(:G, signature.key_info.key_value.dsa_g),
            element(:Y, signature.key_info.key_value.dsa_y)])]),
        element(:X509Data,[
          element(:X509IssuerSerial,[
            element(:X509IssuerName, signature.key_info.x509_data.issuer_serial.issuer_name),
            element(:X509SerialNumber, signature.key_info.x509_data.issuer_serial.serial_number)]),
          element(:X509SubjectName, signature.key_info.x509_data.subject_name)] ++
        generateCertificates(signature.key_info.x509_data.certificates))
      ])] ++
      generateOptions(signature.options))
  end

  defp generateCertificates(certs) do
    for c <- certs, do: element(:X509Certificate, c)
  end

  defp generateSignedInfo(options) do
    references=for o <- Enum.with_index(options), do: element(:Reference, %{URI: "#option#{elem(o,1)}"}, [
      element(:Transforms, [
        element(:Transform, %{"Algorithm": "http://www.w3.org/TR/2001/REC-xml-c14n-20010315"}, "")]),
      element(:DigestMethod, %{"Algorithm": "http://www.w3.org/2000/09/xmldsig#sha1"}, ""),
      element(:DigestValue, elem(o,0).sha1_digest)])

    element(:SignedInfo,[
      element(:CanonicalizationMethod, %{"Algorithm": "http://www.w3.org/TR/2001/REC-xml-c14n-20010315"},''),
      element(:SignatureMethod, %{"Algorithm": "http://www.w3.org/2000/09/xmldsig#dsa-sha1"},'')] ++
      references)
  end

  defp generateOptions(options) do
    for option <- Enum.with_index(options), do: element("dsig:Object", %{xmlns: "", "xmlns:dsig": "http://www.w3.org/2000/09/xmldsig#", "Id": "#option#{elem(option,1)}"}, [generateOption(elem(option,0))])
  end

  defp generateOption(option) do
    element(:Option, [
      element(:VSerialNum, option.v_serial_num),
      element(:DeviceId, [
        element(:Manufacturer, option.deviceid.manufacturer),
        element(:OUI, option.deviceid.oui),
        element(:ProductClass, option.deviceid.product_class),
        element(:SerialNumber, option.deviceid.serial_number)]),
      element(:OptionIdent, option.option_ident),
      element(:OptionDesc, option.option_desc),
      element(:StartDate, timeString(option.start_date)),
      element(:Duration, option.duration),
      element(:DurationUnits, option.duration_units),
      element(:Mode, option.mode)])
  end
end


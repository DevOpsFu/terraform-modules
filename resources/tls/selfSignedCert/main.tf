resource "tls_private_key" "tlsPrivateKey" {
  algorithm   = var.keyAlgorithm
  ecdsa_curve = var.ecdsaCurve
  rsa_bits    = var.rsaBits
}

resource "tls_self_signed_cert" "tlsSelfSignedCert" {
  key_algorithm         = tls_private_key.tlsPrivateKey.algorithm
  private_key_pem       = tls_private_key.tlsPrivateKey.private_key_pem
  validity_period_hours = var.validityPeriodHours
  is_ca_certificate     = var.isCaCertificate
  allowed_uses          = var.allowedUses

  subject {
    common_name         = var.subject.commonName
    organization        = var.subject.organization
    organizational_unit = var.subject.organizationalUnit
    street_address      = var.subject.steetAddress
    locality            = var.subject.locality
    province            = var.subject.province
    country             = var.subject.country
    postal_code         = var.subject.postalCode
    serial_number       = var.subject.serialNumber
  }
}

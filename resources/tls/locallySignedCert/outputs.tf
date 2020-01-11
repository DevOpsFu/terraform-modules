output certPem {
  value = tls_locally_signed_cert.tlsLocallySignedCert.cert_pem
}

output privateKeyPem {
  value = tls_private_key.tlsPrivateKey.private_key_pem
}

output validityStartTime {
  value = tls_locally_signed_cert.tlsLocallySignedCert.validity_start_time
}

output validityEndTime {
  value = tls_locally_signed_cert.tlsLocallySignedCert.validity_end_time
}

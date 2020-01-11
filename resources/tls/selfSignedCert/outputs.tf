output certPem {
  value = tls_self_signed_cert.tlsSelfSignedCert.cert_pem
}

output privateKeyPem {
  value = tls_private_key.tlsPrivateKey.private_key_pem
}

output keyAlgorithm {
  value = tls_self_signed_cert.tlsSelfSignedCert.key_algorithm
}

output validityStartTime {
  value = tls_self_signed_cert.tlsSelfSignedCert.validity_start_time
}

output validityEndTime {
  value = tls_self_signed_cert.tlsSelfSignedCert.validity_end_time
}

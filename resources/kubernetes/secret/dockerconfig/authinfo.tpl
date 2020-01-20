${jsonencode({
  "auths" = { 
    "${fqdn}" = {
      "username" = "${username}",
      "password" = "${password}",
      "auth"     = "${encodedAuth}"
    }
  }
})}

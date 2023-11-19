locals {
  networks = yamldecode(chomp(data.http.rodent1_common_networks.response_body))
}

terraform {
  cloud {
    organization = "rodent-cc"
    workspaces {
      name = "home-unifi-provisioner"
    }
  }

  required_providers {
    unifi = {
      source  = "paultyng/unifi"
      version = "0.41.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.4.0"
    }
  }
}

data "http" "rodent1_common_networks" {
  url = "https://raw.githubusercontent.com/rodent1/home-ops/main/infrastructure/_shared/networks.yaml"
}

module "onepassword_item_unifi_controller" {
  source = "github.com/bjw-s/terraform-1password-item?ref=main"
  vault  = "home-ops"
  item   = "Unifi Controller"
}

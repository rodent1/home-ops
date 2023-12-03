terraform {
  cloud {
    organization = "rodent-cc"
    workspaces {
      name = "home-unifi-provisioner"
    }
  }

  required_providers {
    unifi = {
      source = "akerl/unifi"
      version = "0.41.10"
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

module "config" {
  source = "./modules/config"

  networks            = local.networks
  wlan_main_ssid      = module.onepassword_item_unifi_controller.fields.wlan_main_ssid
  wlan_main_password  = module.onepassword_item_unifi_controller.fields.wlan_main_password
  wlan_iot_ssid       = module.onepassword_item_unifi_controller.fields.wlan_iot_ssid
  wlan_iot_password   = module.onepassword_item_unifi_controller.fields.wlan_iot_password
  wlan_family_ssid     = module.onepassword_item_unifi_controller.fields.wlan_guest_ssid
  wlan_family_password = module.onepassword_item_unifi_controller.fields.wlan_guest_password

  providers = {
    unifi = unifi.home
  }
}

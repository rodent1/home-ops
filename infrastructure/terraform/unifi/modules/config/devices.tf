locals {
  udm_pro_name           = "UDM-Pro"
  switch_core_1_name     = "Switch - Core 1"
  switch_core_2_name     = "Switch - Core 2"
  switch_iptv_name       = "Switch - IPTV"
  ap_downstairs_name     = "AP - Downstairs livingroom"
  ap_upstairs_name       = "AP - Upstairs livingroom"
}

resource "unifi_device" "udm_pro" {
  mac  = "24:5a:4c:79:73:21"
  name = local.udm_pro_name
  site = unifi_site.default.name

  port_override {
    number = 1
    name   = local.switch_core_2_name
    # port_profile_id = resource.unifi_port_profile.all.id
  }

  port_override {
    number = 2
    # port_profile_id = resource.unifi_port_profile.all.id
  }

  port_override {
    number = 3
    # port_profile_id = resource.unifi_port_profile.all.id
  }

  port_override {
    number = 4
    # port_profile_id = resource.unifi_port_profile.all.id
  }

  port_override {
    number = 5
    # port_profile_id = resource.unifi_port_profile.all.id
  }

  port_override {
    number = 6
    # port_profile_id = resource.unifi_port_profile.all.id
  }

  port_override {
    number = 7
    # port_profile_id = resource.unifi_port_profile.all.id
  }

  port_override {
    number = 8
    # port_profile_id = resource.unifi_port_profile.all.id
  }

  port_override {
    number = 9
    name   = "WAN"
    port_profile_id = resource.unifi_port_profile.wan.id
  }
}

resource "unifi_device" "switch_core_1" {
  mac  = "74:ac:b9:47:55:86"
  name = local.switch_core_1_name
  site = unifi_site.default.name

  port_override {
    number = 1
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 2
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number          = 3
# port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number          = 4
# port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number          = 5
# port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 6
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 7
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 8
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 9
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 10
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 11
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 12
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 13
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 14
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 15
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 16
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 17
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 18
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 19
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 20
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 21
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 22
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 23
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 24
    # port_profile_id = resource.unifi_port_profile.all.id
  }
}

resource "unifi_device" "switch_core_2" {
  mac  = "e0:63:da:8d:19:e1"
  name = local.switch_core_2_name
  site = unifi_site.default.name

  port_override {
    number = 1
    name   = local.switch_core_1_name
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 2
    name   = local.switch_core_1_name
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 3
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 4
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 5
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 6
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 7
    # port_profile_id = resource.unifi_port_profile.all.id
  }
  port_override {
    number = 8
    # port_profile_id = resource.unifi_port_profile.all.id
  }
}

resource "unifi_device" "ap_downstairs" {
  mac  = "78:45:58:61:f9:48"
  name = local.ap_downstairs_name
  site = unifi_site.default.name
}

resource "unifi_device" "ap_upstairs" {
  mac  = "e0:63:da:09:0b:79"
  name = local.ap_upstairs_name
  site = unifi_site.default.name
}

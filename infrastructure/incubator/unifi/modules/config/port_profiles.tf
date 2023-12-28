resource "unifi_port_profile" "all" {
  name                  = "All"
  native_networkconf_id = data.unifi_network.default.id

  autoneg  = true
  forward  = "all"
  poe_mode = "auto"
}

resource "unifi_port_profile" "iot" {
  name                  = "IoT"
  native_networkconf_id = unifi_network.iot.id

  autoneg  = true
  forward  = "native"
  poe_mode = "auto"
}

resource "unifi_port_profile" "servers" {
  name                  = "Servers"
  native_networkconf_id = unifi_network.servers.id

  autoneg  = true
  forward  = "native"
  poe_mode = "auto"
}

resource "unifi_port_profile" "wan" {
  name                  = "WAN"
  native_networkconf_id = unifi_network.servers.id

  autoneg  = true
}

resource "unifi_port_profile" "disabled" {
  name = "Disabled"

  forward  = "disabled"
  poe_mode = "off"
}


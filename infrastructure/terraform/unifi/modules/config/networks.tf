resource "unifi_network" "servers" {
  name    = "Servers"
  site    = unifi_site.default.name
  vlan_id = 10

  dhcp_dns            = []
  dhcp_enabled        = false
  dhcp_lease          = 0
  dhcp_relay_enabled  = false
  dhcpd_boot_enabled  = false
  dhcp_v6_dns_auto    = false
  igmp_snooping       = false
  ipv6_interface_type = "none"
  ipv6_ra_enable      = false
  network_group       = "LAN"
  purpose             = "vlan-only"
  wan_dns             = []
  wan_egress_qos      = 0
}

resource "unifi_network" "trusted" {
  name    = "Trusted"
  site    = unifi_site.default.name
  vlan_id = 20

  dhcp_dns            = []
  dhcp_enabled        = false
  dhcp_lease          = 0
  dhcp_relay_enabled  = false
  dhcpd_boot_enabled  = false
  dhcp_v6_dns_auto    = false
  igmp_snooping       = false
  ipv6_interface_type = "none"
  ipv6_ra_enable      = false
  network_group       = "LAN"
  purpose             = "vlan-only"
  wan_dns             = []
  wan_egress_qos      = 0
}

resource "unifi_network" "iot" {
  name    = "IoT"
  site    = unifi_site.default.name
  vlan_id = 30

  dhcp_dns            = []
  dhcp_enabled        = false
  dhcp_lease          = 0
  dhcp_relay_enabled  = false
  dhcpd_boot_enabled  = false
  dhcp_v6_dns_auto    = false
  igmp_snooping       = false
  ipv6_interface_type = "none"
  ipv6_ra_enable      = false
  network_group       = "LAN"
  purpose             = "vlan-only"
  wan_dns             = []
  wan_egress_qos      = 0
}

resource "unifi_network" "family" {
  name    = "Family LAN"
  site    = unifi_site.default.name
  vlan_id = 80

  dhcp_dns            = []
  dhcp_enabled        = false
  dhcp_lease          = 0
  dhcp_relay_enabled  = false
  dhcpd_boot_enabled  = false
  dhcp_v6_dns_auto    = false
  igmp_snooping       = false
  ipv6_interface_type = "none"
  ipv6_ra_enable      = false
  network_group       = "LAN"
  purpose             = "vlan-only"
  wan_dns             = []
  wan_egress_qos      = 0
}

resource "unifi_network" "guest" {
  name    = "IPTV LAN"
  site    = unifi_site.default.name
  vlan_id = 90

  dhcp_dns            = []
  dhcp_enabled        = false
  dhcp_lease          = 0
  dhcp_relay_enabled  = false
  dhcpd_boot_enabled  = false
  dhcp_v6_dns_auto    = false
  igmp_snooping       = false
  ipv6_interface_type = "none"
  ipv6_ra_enable      = false
  network_group       = "LAN"
  purpose             = "vlan-only"
  wan_dns             = []
  wan_egress_qos      = 0
}

resource "unifi_network" "wan" {
  name    = "wan"
  site    = unifi_site.default.name

  network_group       = "WAN"
  purpose             = "wan"
}

data "unifi_network" "default" {
  name = "Default"
}

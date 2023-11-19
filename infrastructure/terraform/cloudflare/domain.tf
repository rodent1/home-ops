module "cf_domain_hardware" {
  source     = "./modules/cf_domain"
  domain     = "rodent.cc"
  account_id = cloudflare_account.main.id

  dns_entries = [
    {
      name  = "ipv4"
      value = local.home_ipv4
    },
  ]

  waf_custom_rules = [
    {
      enabled     = true
      description = "Firewall rule to block bots and threats determined by CF"
      expression  = "(cf.client.bot) or (cf.threat_score gt 14)"
      action      = "block"
    },
    {
      enabled     = true
      description = "Firewall rule to block certain countries"
      expression  = "(ip.geoip.country in {\"CN\" \"IN\" \"KP\" \"RU\"})"
      action      = "block"
    },
  ]
}

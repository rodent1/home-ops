provider "cloudflare" {
  email   = module.onepassword_item_cloudflare.fields["CLOUDFLARE_EMAIL"]
  api_key = module.onepassword_item_cloudflare.fields["CLOUDFLARE_API_KEY"]
}

provider "cloudflare" {
  api_token = module.onepassword_item_cloudflare.fields["api-token"]
}

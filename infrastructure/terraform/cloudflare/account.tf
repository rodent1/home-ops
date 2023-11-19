resource "cloudflare_account" "main" {
  name              = "My main Cloudflare account"
  type              = "standard"
  enforce_twofactor = false
}

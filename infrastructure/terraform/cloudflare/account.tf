resource "cloudflare_account" "main" {
  name              = "Home-ops"
  type              = "standard"
  enforce_twofactor = false
}

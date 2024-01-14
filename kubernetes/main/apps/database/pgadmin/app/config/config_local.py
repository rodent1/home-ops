AUTHENTICATION_SOURCES = ['oauth2']
OAUTH2_AUTO_CREATE_USER = True
MASTER_PASSWORD_REQUIRED = False

OAUTH2_CONFIG = [{
  'OAUTH2_NAME': 'authentik',
  'OAUTH2_DISPLAY_NAME': 'Authentik',
  'OAUTH2_CLIENT_ID': '{{ .OAUTH2_CLIENT_ID }}',
  'OAUTH2_CLIENT_SECRET': '{{ .OAUTH2_CLIENT_SECRET }}',
  'OAUTH2_TOKEN_URL': 'https://authentik.${SECRET_DOMAIN}/application/o/token/',
  'OAUTH2_AUTHORIZATION_URL': 'https://authentik.${SECRET_DOMAIN}/application/o/authorize/',
  'OAUTH2_USERINFO_ENDPOINT': 'https://authentik.${SECRET_DOMAIN}/application/o/userinfo/',
  'OAUTH2_SERVER_METADATA_URL': 'https://authentik.${SECRET_DOMAIN}/application/o/pgadmin/.well-known/openid-configuration',
  'OAUTH2_API_BASE_URL': 'https://authentik.${SECRET_DOMAIN}/',
  'OAUTH2_SCOPE': 'openid email profile'
}]

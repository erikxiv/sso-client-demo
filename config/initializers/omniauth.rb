# Change this omniauth configuration to point to your registered provider
# Since this is a registered application, add the app id and secret here
APP_ID = ENV["IDENTITY_CLIENT_APP_ID"]
APP_SECRET = ENV["IDENTITY_CLIENT_APP_SECRET"]

CUSTOM_PROVIDER_URL = ENV["IDENTITY_PROVIDER_URL"]

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :oauth_demo, APP_ID, APP_SECRET
end

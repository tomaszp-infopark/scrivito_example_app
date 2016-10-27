Rails.application.google_maps_api_key = ENV["GOOGLE_MAPS_API_KEY"]

Scrivito.configure do |config|
  config.inject_preset_routes = false
end

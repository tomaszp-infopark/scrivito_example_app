Rails.application.editor_password = ENV["EDITOR_PASSWORD"]
Rails.application.google_maps_api_key = ENV["GOOGLE_MAPS_API_KEY"]

Scrivito.configure do |config|
  config.inject_preset_routes = false
  config.api_key = ENV["SCRIVITO_API_KEY"]
  config.tenant = ENV["SCRIVITO_TENANT"]
  config.editing_auth do |env|
    request = Rack::Request.new(env)
    if user = User.from_session(request.session)
      Scrivito::User.define(user.username) do |u|
        u.description { user.display_name }
        u.is_admin!
      end
    end
  end
end

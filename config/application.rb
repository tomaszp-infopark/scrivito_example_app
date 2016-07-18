require File.expand_path('../boot', __FILE__)

require "rails"
require "active_model/railtie"
require "active_job/railtie"
# require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

Bundler.require(*Rails.groups)

module ScrivitoExampleApp
  class Application < Rails::Application
    attr_accessor :editor_password
    attr_accessor :google_maps_api_key

    def google_maps_api_key_present?
      google_maps_api_key.present? && google_maps_api_key != "PLACEHOLDER"
    end
  end
end

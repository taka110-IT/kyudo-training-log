require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module KyudoTrainingLog
  class Application < Rails::Application
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
    config.i18n.default_locale = :ja
    config.i18n.available_locales = [:en, :ja]
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    config.time_zone = 'Asia/Tokyo'
    config.active_record.default_timezone= :local
    # config.eager_load_paths << Rails.root.join("extras")
    config.beginning_of_week = :sunday
  end
end

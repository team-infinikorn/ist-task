require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IstTask
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Don't generate system test files.
    config.generators.system_tests = nil
    config.action_controller.default_protect_from_forgery = true

    # Autoload custom directories
    config.autoload_paths += %W(#{config.root}/app/models/users)
    config.autoload_paths += %W(#{config.root}/app/services)
    config.autoload_paths += %W(#{config.root}/lib)

    # Eager load custom directories - for prod mode
    config.eager_load_paths += %W(#{config.root}/app/models/users)
    config.eager_load_paths += %W(#{config.root}/app/services)
    config.eager_load_paths += %W(#{config.root}/lib)
  end
end

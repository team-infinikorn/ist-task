# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

if Rails.env.production?
  DelayedJobWeb.use Rack::Auth::Basic do |username, password|
    ActiveSupport::SecurityUtils.secure_compare('curve', username) && ActiveSupport::SecurityUtils.secure_compare('Abcd#1234', password)
  end
end

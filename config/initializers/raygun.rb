require "raygun/sidekiq"

Raygun.setup do |config|
  config.api_key = ENV["RAYGUN_APIKEY"]
  config.filter_parameters = Rails.application.config.filter_parameters
  config.enable_reporting = Rails.env.staging? || Rails.env.production?
  config.affected_user_method = :current_user
  config.affected_user_identifier_methods << [:email, :id]
end

# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # origins ENV["CLIENT_URL"] ? ENV["CLIENT_URL"].split(",").map { |origin| origin.strip } : "0.0.0.0:4200"
    origins "http://localhost:4200"

    resource "/graphql",
      headers: :any,
      # methods: [:get, :post, :put, :patch, :delete, :options, :head],
      methods: [:post],
      credentials: true
  end
end

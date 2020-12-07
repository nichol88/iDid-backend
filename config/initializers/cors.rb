# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    # puts "React App URL: #{ENV['REACT_APP_URL']}"
    origins ["#{ENV['REACT_APP_URL']}", 'http://localhost:19006'] # , additional args; can use regex
    # origins 'https://idid.netlify.app'
    # origins 'http://localhost:3000' # for local
    

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      credentials: true
  end
end

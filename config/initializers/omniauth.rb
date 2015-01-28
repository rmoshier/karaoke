Rails.application.config.middleware.use OmniAuth::Builder do
  provider :rdio, ENV["RDIO_API_KEY"], ENV["RDIO_API_SECRET"],
           :scope => 'read'
end

Rails.application.config.middleware.use OmniAuth::Builder do
#provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
	provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_SECRET"],
		         scope: 'profile', image_aspect_ratio: 'square', image_size: 48, access_type: 'online', name: 'google', skip_jwt: true
end

class User < ActiveRecord::Base
	enum status: [:user, :moderator, :admin]
	has_many :posts
	def self.from_omniauth(auth_hash)
		user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'], name: auth_hash['info']['name'])
		user.url = auth_hash['info']['urls'][user.provider.capitalize]
		user.save!
		user
	end
end
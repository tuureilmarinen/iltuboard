class User < ActiveRecord::Base
	enum status: [:user, :moderator, :admin]
	has_many :posts
	# User is created or retrived from database and is set as an administrator if he is the first registreted user 
	def self.from_omniauth(auth_hash)
		#user = find_or_create_by(uid: auth_hash['uid'], provider: auth_hash['provider'], name: auth_hash['info']['name'])
		user = find_by provider: auth_hash['provider'], uid: auth_hash['uid']
		if user.nil? #user does not exsist
			user=User.create uid: auth_hash['uid'], provider: auth_hash['provider'], name: auth_hash['info']['name']
			user.admin! if User.all.size==1 #first user created is set as admi
		else # user exsists 
			user.name = auth_hash['info']['name']
		end

		# Google provides url only if Google+ profile exsists
		user.url = auth_hash['info']['urls'][user.provider.capitalize] unless auth_hash['info']['urls'].nil?
		user.save!

		user # user is returned
	end

	def to_s
		"#{self.name} (#{self.id})"
	end
end
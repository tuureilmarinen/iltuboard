class Post < ActiveRecord::Base
	enum show_name: [:anonymous, :nick, :registered, :real_name]
end

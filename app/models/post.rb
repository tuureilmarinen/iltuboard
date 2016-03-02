class Post < ActiveRecord::Base
	enum show_name: [:anonymous, :nick, :registered, :name]
end

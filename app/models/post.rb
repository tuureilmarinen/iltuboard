class Post < ActiveRecord::Base
	enum show_name: [:anonymous, :nick, :registered, :real_name]
	belongs_to :topic
	delegate :board, to: :topic
end

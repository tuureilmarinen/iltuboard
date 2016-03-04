class Post < ActiveRecord::Base
	enum show_name: [:anonymous, :nick, :registered, :real_name]
	belongs_to :topic
	belongs_to :user
	has_one :ban
	delegate :board, to: :topic
	def banned?
		not self.ban.nil?
	end
end

class Post < ActiveRecord::Base
	enum show_name: [:anonymous, :nick, :registered, :real_name]
	belongs_to :topic
	belongs_to :user
	has_one :ban
	delegate :board, to: :topic
	mount_uploader :attachment, AttachmentUploader
	
	validates :content, presence: true
	#validates :topic, presence: true # currently not in use because accepting nested attributes in topic wont work otherwise
	validates :show_name, presence: true

	def banned?
		not self.ban.nil?
	end
	def url
		self.topic.url+"#"+self.id.to_s
	end
end

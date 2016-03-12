class Post < ActiveRecord::Base
	enum show_name: [:anonymous, :nick, :registered, :real_name]
	belongs_to :topic
	belongs_to :user
	has_one :ban
	delegate :board, to: :topic
	#has_many :post_attachments
	#accepts_nested_attributes_for :post_attachments
	mount_uploader :attachment, AttachmentUploader
	def banned?
		not self.ban.nil?
	end
	def url
		self.topic.url+"#"+self.id.to_s
	end
end

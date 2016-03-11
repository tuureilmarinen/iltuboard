class PostAttachment < ActiveRecord::Base
	mount_uploader :file, FileUploader
	belongs_to :post
end

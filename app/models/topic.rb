class Topic < ActiveRecord::Base
	belongs_to :board
	has_many :posts, dependent: :destroy
	validates :name, presence: true
	accepts_nested_attributes_for :posts
	def get_first_and_last(f=1,l=3)
		p=self.posts.first;
		p<<self.posts.last(n)
		p
	end

	def url
		"/"+self.board.url+"/"+self.id.to_s
	end

	def op
		self.posts.first
	end

	def latest_post
		unless self.latest_post_id.nil?
			Post.find(self.latest_post_id)
		else
			nil
		end
	end

	def latest_post=(post)
		if post.class.name=="Post"
			self.latest_post_id=post.id
			self.save
		else
			false
		end
	end
end

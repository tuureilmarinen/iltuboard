class Topic < ActiveRecord::Base
	belongs_to :board
	has_many :posts, dependent: :destroy
	validates :name, presence: true
	accepts_nested_attributes_for :posts
	def get_first_and_last(f=1,l=3)
		p=self.posts.first(f)
		p+self.posts.last(l)
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
		end
	end
	def self.all_sorted
		Topic.find_by_sql ["select topics.* from topics
			left join posts on topics.latest_post_id=posts.id
			order by posts.created_at desc;"]
	end
end

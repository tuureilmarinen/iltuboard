class Topic < ActiveRecord::Base
	belongs_to :board
	has_many :posts, dependent: :destroy
	def get_first_and_last(f=1,l=3)
		p=self.posts.first;
		p<<self.posts.last(n)
		p
	end
	def url
		"/"+self.board.url+"/"+self.id.to_s
	end
end

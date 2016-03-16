class Board < ActiveRecord::Base
	has_many :topics, dependent: :destroy
	has_many :posts, through: :topics
	validates :url, uniqueness: { case_sensitive: false }
	validates :url, exclusion: { in: %w(boards topics posts users),
    	message: "%{value} is reserved." }

    def find_topics_sorted
		Topic.find_by_sql ["select topics.* from topics left join posts on topics.latest_post_id=posts.id where topics.board_id=? order by posts.created_at desc;",self.id]
    end
end

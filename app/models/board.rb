class Board < ActiveRecord::Base
	has_many :topics, dependent: :destroy
	has_many :posts, through: :topics
	validates :url, uniqueness: { case_sensitive: false }
	validates :url, exclusion: { in: %w(boards topics posts users),
    	message: "%{value} is reserved." }

    def find_topics_sorted
		Topic.find_by_sql ["select distinct * from (select topics.* from topics join posts on posts.topic_id=topics.id where topics.board_id=1 order by posts.created_at asc);",self.id]
    end
end

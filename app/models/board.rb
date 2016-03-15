class Board < ActiveRecord::Base
	has_many :topics, dependent: :destroy
	has_many :posts, through: :topics
	validates :url, uniqueness: { case_sensitive: false }
	validates :url, exclusion: { in: %w(boards topics posts users),
    message: "%{value} is reserved." }
end

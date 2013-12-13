class Comment < ActiveRecord::Base
  attr_accessible :post_id, :rating, :text, :user_id, :num_ratings

  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :text, presence: true
  validates :num_ratings, presence: true
  validates :rating, presence: true

  belongs_to :post
  belongs_to :user
  has_many :voters

end

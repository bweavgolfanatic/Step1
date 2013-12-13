class Comment < ActiveRecord::Base
  attr_accessible :post_id, :rating, :text, :user_id, :numratings

  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :text, presence: true
  validates :num_ratings, presence: true

  belongs_to :post
  belongs_to :user

end

class Post < ActiveRecord::Base
  attr_accessible :difficulty, :isfinished, :ispublic, :rating, :user_id, :num_ratings, :title

  has_many :steps
  has_many :comments
  belongs_to :user

  validates :difficulty, presence: true
  validates :ispublic, presence: true
  validates :isfinished, presence: true
  validates :user_id, presence: true
  validates :num_ratings, presence: true
  validates :title, presence: true

end

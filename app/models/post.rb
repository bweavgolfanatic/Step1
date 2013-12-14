class Post < ActiveRecord::Base
  attr_accessible :difficulty, :isfinished, :ispublic, :rating, :user_id, :num_ratings, :title, :category

  has_many :steps
  has_many :comments
  has_many :voters
  belongs_to :user

  validates :category, presence: true
  validates :difficulty, presence: true
  validates :ispublic, presence: true
  validates :isfinished, presence: true
  validates :user_id, presence: true
  validates :num_ratings, presence: true
  validates :title, presence: true
  validates :rating, presence: true

  validates_uniqueness_of :title

end

class StepComment < ActiveRecord::Base
  attr_accessible :rating, :step_id, :text, :user_id, :num_ratings

  validates :step_id, presence: true
  validates :text, presence: true
  validates :user_id, presence: true
  validates :rating, presence: true
  validates :num_ratings, presence: true

  belongs_to :step
  belongs_to :user
  has_many :voters

end

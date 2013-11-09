class StepComment < ActiveRecord::Base
  attr_accessible :rating, :step_id, :text, :user_id

  validates :step_id, presence: true
  validates :text, presence: true
  validates :user_id, presence: true

  belongs_to :step
  belongs_to :user

end

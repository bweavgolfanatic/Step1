class Step < ActiveRecord::Base
  attr_accessible :post_id, :text

  validates :post_id, presence: true
  has_many :step_comments
  belongs_to :post
end

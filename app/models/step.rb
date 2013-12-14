class Step < ActiveRecord::Base
  attr_accessible :post_id, :text, :picture

  validates :post_id, presence: true
  validates :text, presence: true
  has_many :step_comments
  belongs_to :post

  has_attached_file :picture
end

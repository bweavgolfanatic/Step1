class Step < ActiveRecord::Base
  attr_accessible :post_id, :text, :pic

  validates :post_id, presence: true
  validates :text, presence: true
  validates :pic, presence: true
  has_many :scomments
  belongs_to :post

end

class Comment < ActiveRecord::Base
  attr_accessible :post_id, :rating, :text, :user_id

  validates :post_id, presence: true
  validates :user_id, presence: true
  validates :text, presence: true

  belongs_to :post
  belongs_to :user

end

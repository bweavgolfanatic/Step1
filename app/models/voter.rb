class Voter < ActiveRecord::Base
  attr_accessible :user_id, :username
  validates :username, :presence => true
  validates :user_id, :presence => true
end

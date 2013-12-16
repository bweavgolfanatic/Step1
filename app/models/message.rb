class Message < ActiveRecord::Base
  attr_accessible :sender, :recipient, :body, :subject
  belongs_to :user

end
class User < ActiveRecord::Base
  require 'bcrypt'
  attr_accessible :username, :password, :password_confirmation, :rating, :avatar, :num_ratings
  has_many :posts
  has_many :comments
  has_many :step_comments
  has_one :voter
  has_private_messages
  attr_accessor :password
  before_save :encrypt_password
  after_save :make_voter


  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :username
  validates_presence_of :rating
  validates :num_ratings, :presence => true
  validates_uniqueness_of :username


  def make_voter
    @voter = Voter.new(:user_id => self.id, :username => self.username)
    @voter.save
  end

  def self.authenticate(email, password)
    user = find_by_username(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  
end
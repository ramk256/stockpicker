class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation, :admin
  has_secure_password
  
  before_save :create_remember_token
  
  validates :name,  :presence => true, :length => { :maximum => 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => { :with => VALID_EMAIL_REGEX }
  validates :password, :presence => true, :length => {:minimum => 6}
  
  def admin?
    true
  end
  
  private
  
    def create_remember_token
      self.remember_token = rand(1000000)
    end
end

# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :fb_id, :fb_username
  has_secure_password
  
  
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },  uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  
   before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  def self.fbconnect(params)
    User.create(
                  :name => params[:name],
                  :email => params[:email],
                  :fb_id => params[:fb_id],
                  :fb_username => params[:user_name],
                  :password => "qwaszx",
                  :password_confirmation => "qwaszx"
                )
  end
  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  
end

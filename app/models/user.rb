class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, through: :friendships, dependent: :destroy
  has_secure_password
  
end

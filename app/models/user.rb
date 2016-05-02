class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, through: :friendships, dependent: :destroy
  has_many :user_games
  has_many :games, through: :user_games
  has_secure_password
  
end

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  skill_level     :integer
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string
#

class User < ActiveRecord::Base
  has_many :friendships
  has_many :friends, through: :friendships, dependent: :destroy
  has_many :user_games
  has_many :games, through: :user_games
  has_secure_password
  
end

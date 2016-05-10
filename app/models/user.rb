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

  validates :first_name, :last_name, :skill_level, :email, presence: true
  validates :email, uniqueness: true
  validates :skill_level, numericality: { only_integer: true, 
                                        greater_than: 0, 
                                        less_than_or_equal_to: 5 }

  def order_by_date
    self.games.order(:date)
  end

  def games_next_30_days
    self.order_by_date.where(date: Date.today..Date.today + 30)
  end

  def games_past_30_days
    self.order_by_date.where(date: Date.today - 30..Date.today - 1)
  end
  
end

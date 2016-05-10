# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  date        :date
#  time        :time
#  court_id    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  description :string
#

class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games
  belongs_to :court

  validates :description, :date, :time, :court_id, presence: true

  def avg_skill_level
    # select users.last_name from users 
    # inner join user_games on users.id = user_games.user_id 
    # where user_games.game_id = 1
  end

  def self.upcoming_games
    self.where(date: (Date.today..Date.today + 30))
  end

  
end

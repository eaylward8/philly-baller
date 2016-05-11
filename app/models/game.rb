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
    skill_sum = self.users.pluck(:skill_level).reduce(:+).to_f
    (skill_sum / num_players).round(1)
  end

  def self.upcoming_games
    self.where(date: (Date.today..Date.today + 30)).order(:date).order(:time)
  end

  def num_players
    self.users.count
  end

  def formatted_time
    self.time.strftime('%l:%M %P')
  end

  
end

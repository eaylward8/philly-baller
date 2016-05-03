# == Schema Information
#
# Table name: games
#
#  id         :integer          not null, primary key
#  date       :date
#  time       :time
#  court_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Game < ActiveRecord::Base
  has_many :user_games
  has_many :users, through: :user_games
  belongs_to :court

end

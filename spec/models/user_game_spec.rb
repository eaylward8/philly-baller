# == Schema Information
#
# Table name: user_games
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  game_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe UserGame, type: :model do
  
  describe 'factory' do 
    it 'has a valid factory' do 
      expect(build(:user_game)).to be_valid
    end
  end

end

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

require 'rails_helper'

RSpec.describe Game, type: :model do
  
  describe 'factory' do 
    it 'has a valid factory' do 
      expect(build(:game)).to be_valid
    end
  end

  describe 'validations' do 
    let(:game) { build(:game) }

    it 'is invalid without a description' do 
      game.description = nil
      game.valid?
      
      expect(game.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without a date' do 
      game.date = nil
      game.valid?
      
      expect(game.errors[:date]).to include("can't be blank")
    end

    it 'is invalid without a time' do 
      game.time = nil
      game.valid?
      
      expect(game.errors[:time]).to include("can't be blank")
    end

    it 'is invalid without an associated court' do 
      game.court_id = nil
      game.valid?
      
      expect(game.errors[:court_id]).to include("can't be blank")
    end

  end

  describe 'object relations' do 

    it 'can have many users, through user_games' do 
      game = create(:game, :with_users, number_of_user_games: 2)
      expect(game.users.count).to eq(2)
    end

    it 'belongs to a court' do 
      game = create(:game)
      
      expect(game.court.class).to eq(Court) 
    end

  end

end
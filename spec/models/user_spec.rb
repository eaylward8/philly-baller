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

require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'factory' do 
    it 'has a valid factory' do 
      expect(build(:user)).to be_valid
    end
  end

  describe 'validations' do 
    let(:user) { build(:user) }

    it 'is invalid without a first name' do 
      user.first_name = nil
      user.valid?
      
      expect(user.errors[:first_name]).to include("can't be blank")
    end

    it 'is invalid without a last name' do 
      user.last_name = nil
      user.valid?
      
      expect(user.errors[:last_name]).to include("can't be blank")
    end

    it 'is invalid without a skill level' do 
      user.skill_level = nil
      user.valid?
  
      expect(user.errors[:skill_level]).to include("can't be blank")
    end

    it 'must have a skill level between 1 and 5 (integers only)' do 
      user.skill_level = 7
      user.valid?
  
      expect(user.errors[:skill_level]).to include("must be less than or equal to 5")
    end

    it 'is invalid without an email address' do 
      user.email = nil
      user.valid?
      
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without an email address' do 
      user.password = nil
      user.valid?
      
      expect(user.errors[:password]).to include("can't be blank")
    end

  end

  describe 'object relations' do 

    it 'can have many games, through user_games' do 
      user = create(:user, :with_games, number_of_user_games: 2)
      expect(user.games.count).to eq(2)
    end

  end



end

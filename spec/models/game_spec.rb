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
      binding.pry
    end
  end



end
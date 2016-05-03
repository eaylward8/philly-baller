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
      binding.pry
    end
  end



end

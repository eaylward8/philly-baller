# == Schema Information
#
# Table name: courts
#
#  id               :integer          not null, primary key
#  name             :string
#  address          :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  url              :string
#  council_district :integer
#  pcpc_district    :string
#  site_name        :string
#

require 'rails_helper'

RSpec.describe Court, type: :model do

  describe 'factory' do 
    it 'has a valid factory' do 
      expect(build(:court)).to be_valid
    end
  end

end

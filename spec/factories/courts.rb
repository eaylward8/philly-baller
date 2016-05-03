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
#

FactoryGirl.define do

  factory :court do
    name { "#{Faker::Name.name} Court" }
    address { Faker::Address.street_address }

  end
end
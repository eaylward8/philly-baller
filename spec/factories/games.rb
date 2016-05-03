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


FactoryGirl.define do
  factory :game do
    description { Faker::Lorem.sentence(3, true, 4) }
    date { Faker::Time.between(7.days.ago, Date.today + 7) }
    time { "#{rand(6..20)}:#{[0, 30].sample}" }
  end
end
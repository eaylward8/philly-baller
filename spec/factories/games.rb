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
    association :court

    description { Faker::Lorem.sentence(3, true, 4) }
    date { Faker::Time.between(7.days.ago, Date.today + 7) }
    time { "#{rand(6..20)}:#{[0, 30].sample}" }

    trait :with_users do 
      transient do
        number_of_user_games 1
      end

      after(:create) do |game, evaluator|
        create_list(:user_game, evaluator.number_of_user_games, game: game)
      end
    end

  end
end
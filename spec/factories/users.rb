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

FactoryGirl.define do

  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    skill_level { rand(1..5) }
    email { Faker::Internet.email }
    password '11111'

    trait :with_games do 
      transient do
        number_of_user_games 1
      end

      after(:create) do |user, evaluator|
        create_list(:user_game, evaluator.number_of_user_games, user: user)
      end
    end


  end
end


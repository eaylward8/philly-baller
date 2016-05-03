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
  pending "add some examples to (or delete) #{__FILE__}"
end

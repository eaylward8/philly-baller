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

class Court < ActiveRecord::Base
  has_many :games
  validates :name, :address, presence: true
  validates :name, uniqueness: true

  def self.sort_alphabetically
    self.order(:name)
  end
end

class Circuit < ApplicationRecord
  has_many :tracks

  validates :name, presence: true
  validates :address, presence: true
end

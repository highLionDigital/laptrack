class Circuit < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :tracks, dependent: :destroy
  has_many :races, through: :tracks
  accepts_nested_attributes_for :tracks, allow_destroy: true

  validates :name, presence: true
  validates :address, presence: true
end

class Circuit < ApplicationRecord
  has_many :comments
  has_many :tracks, dependent: :destroy
  accepts_nested_attributes_for :tracks, allow_destroy: true

  validates :name, presence: true
  validates :address, presence: true
end

class Track < ApplicationRecord
  TYPES = ['indoor', 'outdoor', 'hybrid']

  belongs_to :circuit
  has_many :races, dependent: :destroy

  validates :track_type, inclusion: { in: TYPES }
end

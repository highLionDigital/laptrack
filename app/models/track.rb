class Track < ApplicationRecord
  LOCATIONS =  [ 'indoor', 'outdoor', 'hybrid' ]

  belongs_to :circuit
  has_many :races

end

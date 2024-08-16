class Driver < ApplicationRecord
  belongs_to :user
  has_many :races

  validates :alias, uniqueness: true, allow_nil: true
end

class User < ApplicationRecord
  has_one :driver, dependent: :destroy
  after_create :ensure_driver_exists

  def ensure_driver_exists
    create_driver(bio: "No bio yet", country: "Unknown") unless driver
  end
end
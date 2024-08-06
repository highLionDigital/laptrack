class Race < ApplicationRecord
    belongs_to :driver
    belongs_to :track

    validates :start_time, presence: true
    validates :total_laps, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :best_lap_time, presence: true
    validates :avg_lap_time, presence: true

    validate :start_time_cannot_be_in_future

    def circuit
      track.circuit
    end

    private

    def start_time_cannot_be_in_future
      if start_time.present? && start_time > Time.current
        errors.add(:start_time, "can't be in the future")
      end
    end
end

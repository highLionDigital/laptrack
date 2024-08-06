class CreateRaces < ActiveRecord::Migration[7.0]
  def change
    create_table :races do |t|
      t.references :driver, null: false, foreign_key: true
      t.references :track, null: false, foreign_key: true
      t.datetime :start_time, null: false
      t.integer :total_laps, null: false
      t.string :avg_lap_time
      t.string :best_lap_time

      t.timestamps
    end
    add_index :races, [:driver_id, :track_id, :start_time]
  end
end

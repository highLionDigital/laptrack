class FixTracks < ActiveRecord::Migration[7.0]
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :location
      t.references :circuit, null: false, foreign_key: true

      t.timestamps
    end
  end
end

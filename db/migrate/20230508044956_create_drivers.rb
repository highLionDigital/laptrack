class CreateDrivers < ActiveRecord::Migration[7.0]
  def change
    create_table :drivers do |t|
      t.text :bio
      t.string :country
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

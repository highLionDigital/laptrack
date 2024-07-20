class CreateCircuits < ActiveRecord::Migration[7.0]
  def change
    create_table :circuits do |t|
      t.string :name
      t.date :opened
      t.string :website
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end

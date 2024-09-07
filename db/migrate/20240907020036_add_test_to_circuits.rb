class AddTestToCircuits < ActiveRecord::Migration[7.0]
  def change
    add_column :circuits, :test, :boolean, default: false
  end
end
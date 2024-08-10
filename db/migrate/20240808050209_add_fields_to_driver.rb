class AddFieldsToDriver < ActiveRecord::Migration[7.0]
  def change
    add_column :drivers, :alias, :string
    add_column :drivers, :dob, :date
  end
end

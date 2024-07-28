class ChangeOpenedFromDateToString < ActiveRecord::Migration[7.0]
  def up
    change_column :circuits, :opened, :string
  end

  def down
    change_column :circuits, :opened, :date
  end
end
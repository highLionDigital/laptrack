class AddAuth0FieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :picture, :string
    add_column :users, :email_verified, :boolean
  end
end

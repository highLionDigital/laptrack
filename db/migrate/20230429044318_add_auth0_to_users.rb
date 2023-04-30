class AddAuth0ToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :auth0_id, :integer
  end
end

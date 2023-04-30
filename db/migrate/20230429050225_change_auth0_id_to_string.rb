class ChangeAuth0IdToString < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :auth0_id, :string
  end
end

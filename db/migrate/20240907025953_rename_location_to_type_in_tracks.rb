class RenameLocationToTypeInTracks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tracks, :location, :track_type
  end
end
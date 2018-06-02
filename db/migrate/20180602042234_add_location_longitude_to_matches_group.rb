class AddLocationLongitudeToMatchesGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :matches_groups, :location_longitude, :float
  end
end

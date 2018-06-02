class AddLocationLongitudeToMatchesKnockout < ActiveRecord::Migration[5.0]
  def change
    add_column :matches_knockouts, :location_longitude, :float
  end
end

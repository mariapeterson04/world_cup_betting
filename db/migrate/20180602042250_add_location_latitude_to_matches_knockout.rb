class AddLocationLatitudeToMatchesKnockout < ActiveRecord::Migration[5.0]
  def change
    add_column :matches_knockouts, :location_latitude, :float
  end
end

class AddCityLongitudeToMatchesKnockout < ActiveRecord::Migration[5.0]
  def change
    add_column :matches_knockouts, :city_longitude, :float
  end
end

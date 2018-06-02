class AddCityLongitudeToMatchesGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :matches_groups, :city_longitude, :float
  end
end

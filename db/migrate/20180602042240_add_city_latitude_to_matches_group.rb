class AddCityLatitudeToMatchesGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :matches_groups, :city_latitude, :float
  end
end

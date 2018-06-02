class AddCityFormattedAddressToMatchesGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :matches_groups, :city_formatted_address, :string
  end
end

class AddCityFormattedAddressToMatchesKnockout < ActiveRecord::Migration[5.0]
  def change
    add_column :matches_knockouts, :city_formatted_address, :string
  end
end

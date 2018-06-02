class AddLocationFormattedAddressToMatchesKnockout < ActiveRecord::Migration[5.0]
  def change
    add_column :matches_knockouts, :location_formatted_address, :string
  end
end

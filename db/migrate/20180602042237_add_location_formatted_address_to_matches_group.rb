class AddLocationFormattedAddressToMatchesGroup < ActiveRecord::Migration[5.0]
  def change
    add_column :matches_groups, :location_formatted_address, :string
  end
end

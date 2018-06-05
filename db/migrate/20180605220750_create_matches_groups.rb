class CreateMatchesGroups < ActiveRecord::Migration
  def change
    create_table :matches_groups do |t|
      t.string :team_one
      t.string :team_two
      t.datetime :date
      t.string :location
      t.text :groupletter
      t.string :city
      t.integer :goals_one
      t.integer :goals_two

      t.timestamps

    end
  end
end

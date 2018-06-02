class CreateMatchesKnockouts < ActiveRecord::Migration
  def change
    create_table :matches_knockouts do |t|
      t.string :team_one
      t.string :team_two
      t.datetime :date
      t.string :location
      t.string :round
      t.string :city
      t.integer :goals_one
      t.integer :goals_two
      t.string :winner

      t.timestamps

    end
  end
end

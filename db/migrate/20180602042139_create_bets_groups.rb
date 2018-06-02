class CreateBetsGroups < ActiveRecord::Migration
  def change
    create_table :bets_groups do |t|
      t.integer :user_id
      t.integer :match_id
      t.integer :bet_team_one
      t.integer :bet_team_two
      t.string :team_one
      t.string :team_two
      t.datetime :date
      t.string :winner

      t.timestamps

    end
  end
end

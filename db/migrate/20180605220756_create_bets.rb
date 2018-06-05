class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :bet_team_one
      t.integer :bet_team_two
      t.integer :user_id
      t.integer :matches_group_id

      t.timestamps

    end
  end
end

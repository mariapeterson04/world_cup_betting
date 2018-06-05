class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :bet_team_one
      t.integer :bet_team_two
      t.integer :user_id
      t.integer :matches_group_id
      t.integer :user_score
      t.integer :rank
      t.string :username

      t.timestamps

    end
  end
end

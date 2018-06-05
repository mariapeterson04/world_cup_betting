class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :users_score
      t.integer :rank
      t.string :username
      t.integer :bet_id

      t.timestamps

    end
  end
end

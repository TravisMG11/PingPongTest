class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.date :date, null: false
      t.integer :winner_id, null: false
      t.integer :loser_id, null: false
      t.integer :winner_score, null: false
      t.integer :loser_score, null: false
    end
  end
end

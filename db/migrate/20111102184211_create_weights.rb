class CreateWeights < ActiveRecord::Migration
  def change
    create_table :weights do |t|
      t.date :date
      t.integer :weight
      t.integer :player_id
      t.integer :week_loss
      t.integer :total_loss
      t.integer :week_percent
      t.integer :total_percent

      t.timestamps
    end
  end
end

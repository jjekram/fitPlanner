class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :sets
      t.integer :reps
      t.integer :workout_id

      t.timestamps
    end
  end
end

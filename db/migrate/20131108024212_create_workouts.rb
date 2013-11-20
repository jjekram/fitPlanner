class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.string :name
      t.string :pic
      t.integer :routine_id
      t.integer :exercise_id
      t.integer :sets

      t.timestamps
    end
  end
end

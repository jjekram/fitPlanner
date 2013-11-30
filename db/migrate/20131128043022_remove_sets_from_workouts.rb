class RemoveSetsFromWorkouts < ActiveRecord::Migration
  def up
    remove_column :workouts, :sets
  end

  def down
    add_column :workouts, :sets, :integer
  end
end

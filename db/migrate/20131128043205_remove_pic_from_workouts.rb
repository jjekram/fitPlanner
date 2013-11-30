class RemovePicFromWorkouts < ActiveRecord::Migration
  def up
    remove_column :workouts, :pic
  end

  def down
    add_column :workouts, :pic, :string
  end
end

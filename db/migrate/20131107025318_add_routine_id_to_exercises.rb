class AddRoutineIdToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :routine_id, :integer
  end
end

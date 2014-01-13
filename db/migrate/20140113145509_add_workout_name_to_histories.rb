class AddWorkoutNameToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :workout_name, :string
  end
end

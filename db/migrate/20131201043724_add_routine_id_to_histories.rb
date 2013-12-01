class AddRoutineIdToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :routine_id, :integer
  end
end

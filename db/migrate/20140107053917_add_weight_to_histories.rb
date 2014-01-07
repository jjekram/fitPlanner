class AddWeightToHistories < ActiveRecord::Migration
  def change
    add_column :histories, :weight, :integer
  end
end

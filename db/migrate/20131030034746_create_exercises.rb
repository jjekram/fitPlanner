class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :title
      t.text :instruction
      t.text :pic
      t.string :page_id

      t.timestamps
    end
  end
end

class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.string :work_sets
      t.text :details
      t.date :workout_date
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

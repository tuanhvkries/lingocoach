class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.text :system_prompt
      t.text :content
      t.string :language

      t.timestamps
    end
  end
end

class CreateChapters < ActiveRecord::Migration[5.0]
  def change
    create_table :chapters do |t|
      t.references :group, foreign_key: true, index: true, null: false
      t.string :name, null: false
      t.integer :position
      t.integer :lessons_count, default: 0, null: false
      t.integer :exercises_count, default: 0, null: false

      t.timestamps
    end
  end
end

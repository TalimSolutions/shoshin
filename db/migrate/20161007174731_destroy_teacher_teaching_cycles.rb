class DestroyTeacherTeachingCycles < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        remove_index :teacher_teaching_cycles, [:teacher_id, :teaching_cycle_id]
      end

      dir.down do
        add_index :teacher_teaching_cycles, [:teacher_id, :teaching_cycle_id], unique: true, name: :index_teacher_teaching_cycles_on_teacher_and_teaching_cycle
      end
    end

    drop_table :teacher_teaching_cycles do |t|
      t.references :teacher, foreign_key: true, index: true, null: false
      t.references :teaching_cycle, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end

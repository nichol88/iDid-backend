class CreateActions < ActiveRecord::Migration[6.0]
  def change
    create_table :actions do |t|
      t.integer :counter_id
      t.integer :routine_id
      t.integer :user_id
      t.integer :reps
      t.float :weight
      t.string :weight_unit
      t.integer :duration

      t.timestamps
    end
  end
end

class DropRoutines < ActiveRecord::Migration[6.0]
  def change
    drop_table :routines
  end
end

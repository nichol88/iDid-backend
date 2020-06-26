class RemoveExtraAttributesFromActions < ActiveRecord::Migration[6.0]
  def change
    remove_column :actions, :routine_id
    remove_column :actions, :weight_unit
    remove_column :actions, :time_unit
  end
end

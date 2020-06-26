class RemoveNameFromActions < ActiveRecord::Migration[6.0]
  def change
    remove_column :actions, :name
  end
end

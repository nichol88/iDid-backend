class RemoveOldTimeColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :actions, :duration
    remove_column :actions, :time_duration    
  end
end

class RenameType < ActiveRecord::Migration[6.0]
  def change
    rename_column :counters, :type, :kind
    rename_column :routines, :type, :kind

  end
end

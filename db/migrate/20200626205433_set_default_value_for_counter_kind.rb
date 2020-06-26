class SetDefaultValueForCounterKind < ActiveRecord::Migration[6.0]
  def change
    change_column :counters, :kind, :string, :default => 'default'
  end
end

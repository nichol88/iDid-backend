class AddTimeToActions < ActiveRecord::Migration[6.0]
  def change
    add_column :actions, :time_duration, :integer
    add_column :actions, :time_unit, :string
  end
end

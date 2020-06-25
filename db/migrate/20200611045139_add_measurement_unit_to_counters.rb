class AddMeasurementUnitToCounters < ActiveRecord::Migration[6.0]
  def change
    add_column :counters, :measurement_unit, :string
  end
end

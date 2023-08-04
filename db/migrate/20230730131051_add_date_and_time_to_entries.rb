class AddDateAndTimeToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :date, :date
    add_column :entries, :time, :time
  end
end

class AddMoodScaleToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :mood_scale, :integer
  end
end

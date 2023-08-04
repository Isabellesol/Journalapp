class AddEntryTypeToEntries < ActiveRecord::Migration[7.0]
  def change
    add_column :entries, :entry_type, :string
  end
end

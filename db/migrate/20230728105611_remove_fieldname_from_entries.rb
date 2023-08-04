class RemoveFieldnameFromEntries < ActiveRecord::Migration[7.0]
  def change
    remove_column :entries, :fieldname, :string
  end
end

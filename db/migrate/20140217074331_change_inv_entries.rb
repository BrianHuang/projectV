class ChangeInvEntries < ActiveRecord::Migration
  def change
    remove_column('inv_entries','sign')
    remove_column('inv_entries','name')
    add_column('inv_entries','note',:text)
    add_column('inv_entries','inv_entry_cate_id',:integer)
  end
end

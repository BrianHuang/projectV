class AddOrderIdToInvEntries < ActiveRecord::Migration
  def change
    add_column('inv_entries','order_id',:integer)
  end
end

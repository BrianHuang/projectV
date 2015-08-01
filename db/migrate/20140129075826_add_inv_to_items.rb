class AddInvToItems < ActiveRecord::Migration
  def change
    add_column('items','inv',:integer,:default => 0)
  end
end

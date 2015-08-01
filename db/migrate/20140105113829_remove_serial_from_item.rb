class RemoveSerialFromItem < ActiveRecord::Migration
  def change
  	remove_index('items','serial')
  	remove_column('items','serial')
  	add_index('items','name',:unique => true)
  end
end

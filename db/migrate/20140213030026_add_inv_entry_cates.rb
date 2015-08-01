class AddInvEntryCates < ActiveRecord::Migration
  def change
    add_column('cates','is_inv_entry',:boolean,:defaul => false)
  end
end

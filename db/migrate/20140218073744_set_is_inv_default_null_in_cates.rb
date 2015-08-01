class SetIsInvDefaultNullInCates < ActiveRecord::Migration
  def change
    change_column('cates','is_inv_entry',:boolean,:default => false)
  end
end

class AddIsPartToSpecs < ActiveRecord::Migration
  def change
    add_column('specs','is_part',:boolean)
  end
end

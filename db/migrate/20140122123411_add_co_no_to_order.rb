class AddCoNoToOrder < ActiveRecord::Migration
  def change
    add_column('orders','co_no',:string)
  end
end

class AdjustOrderAndCustomerField < ActiveRecord::Migration
  def change
    change_table :orders do |t|
      t.string :condition
      t.text :note
      t.string :email
      t.string :payment
    end
    remove_column('orders','memo')
    add_column('customers','ubn',:string)
    # condition
#     memo -> note
#     email
#     payment
# 
# 
#     customer.ubn
  end
end

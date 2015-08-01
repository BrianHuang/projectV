class AddNoteAndEmailToCustomer < ActiveRecord::Migration
  def change
    add_column('customers','email',:string)
    add_column('customers','note',:text)
  end
end

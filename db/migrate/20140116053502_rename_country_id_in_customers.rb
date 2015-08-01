class RenameCountryIdInCustomers < ActiveRecord::Migration
  def change
    rename_column('customers','country','country_id')
  end
end

class RenameOrderCountry < ActiveRecord::Migration
  def change
    rename_column('orders','country','country_id')
  end
end

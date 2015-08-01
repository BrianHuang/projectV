class RenameCountries < ActiveRecord::Migration
  def change
    rename_table('countrys','countries')
  end
end

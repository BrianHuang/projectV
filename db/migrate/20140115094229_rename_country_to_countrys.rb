class RenameCountryToCountrys < ActiveRecord::Migration
  def change
    rename_table('country','countrys')
  end
end

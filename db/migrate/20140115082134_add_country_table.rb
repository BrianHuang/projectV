class AddCountryTable < ActiveRecord::Migration
  def change

    create_table 'country', :force => true do |t|
      t.string 'abbr'
      t.string 'name', :null => false
    end
  end
end

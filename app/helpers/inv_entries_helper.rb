module InvEntriesHelper
  
  def item_select
    select_tag = '<select style="width:150px" name="item_id">
    <option>請選擇...</option>'
    
    Item.where('is_product = true').select('id , name').each do |item|
      select_tag += "<option value='#{item.id}'>#{item.name}</option>"
    end
    
    raw select_tag += '</select>'    
  end

end

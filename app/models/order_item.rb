# -*- encoding : utf-8 -*-
class OrderItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :order
  
  def subtotal
    self.price * self.qty
  end
  
  def deduct_parts
    
  end
  
  def need_parts?
  end
end
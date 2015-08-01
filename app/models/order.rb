# -*- encoding : utf-8 -*-
class Order < ActiveRecord::Base
  has_many :order_item
  has_many :item , through: :order_item
  
  belongs_to :customer
  
  def parts
    self.order_item.each do |oi|
      i.item 
    end
  end
  
  def total_qty
    sum = 0
    self.order_item.each do |oi|
      sum += oi.qty
    end
    sum
  end
    
  def total_price
    sum = 0
    self.order_item.each do |oi|
      sum += oi.subtotal
    end
    sum
  end
  
  def customer_country
    self.customer.country.name
  end
  
  def state
    case self.status
    when 0
      '新單'
    when 1
      '線上'
    when 2
      '備料'
    when 3
      '包好'
    when 4
      '已出'
    else
      '其他'
    end
  end
end
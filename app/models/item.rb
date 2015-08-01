# -*- encoding : utf-8 -*-
class Item < ActiveRecord::Base
  has_many :item_specs
  has_many :specs, through: :item_specs
  
  has_many :parts, through: :item_specs , class_name: 'Item', foreign_key: 'item_id'
  
  belongs_to :cate
  belongs_to :inv_entry

  has_many :order_item
  has_many :order , through: :order_item
end
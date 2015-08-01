# -*- encoding : utf-8 -*-
class Spec < ActiveRecord::Base
  has_many :items, through: :item_specs
  has_many :item_specs
  #has_one :part, class_name: 'Item', foreign_key: 'part_id'
  belongs_to :cate
  
  def save
    if (!self.is_part) 
      self.part_cate_id = nil
    end
    super
  end
  
end
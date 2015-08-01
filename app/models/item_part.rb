# -*- encoding : utf-8 -*-
class ItemPart < ActiveRecord::Base
  belongs_to :item
  has_many :child , :class_name => :item_part , :primary_key => 'parent_id'
  belongs_to :parent , :class_name => :item_part
end
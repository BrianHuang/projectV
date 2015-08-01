# -*- encoding : utf-8 -*-
class ItemSpec < ActiveRecord::Base
  belongs_to :item
  belongs_to :cate
  belongs_to :spec
  belongs_to :part , class_name: 'Item', foreign_key: 'part_id'
end
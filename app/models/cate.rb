# -*- encoding : utf-8 -*-
class Cate < ActiveRecord::Base
  has_many :item
  has_many :spec
end
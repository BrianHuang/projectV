# -*- encoding : utf-8 -*-
class InvEntry < ActiveRecord::Base
  has_one :item
end
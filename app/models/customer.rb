# -*- encoding : utf-8 -*-
class Customer < ActiveRecord::Base
  has_many :order
  belongs_to :country
end
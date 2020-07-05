class Product < ApplicationRecord
  has_many :orders
  has_many :users, through: :orders # 商品可以被许多用户购买

  default_scope -> { order(created_at: :desc) }
end

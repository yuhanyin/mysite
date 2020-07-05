class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :user_id, presence: true
  validates :product_id, presence: true
  # “匿名函数 sort the order
  default_scope -> { order(created_at: :desc) }
end

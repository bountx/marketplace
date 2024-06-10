class Cart < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :purchase_history, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items
  has_one :checkout, dependent: :destroy
end

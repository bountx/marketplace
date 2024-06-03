class Product < ApplicationRecord
  belongs_to :category
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items

  accepts_nested_attributes_for :category, reject_if: :all_blank

  validates :name, :description, :price, :category_id, :user_id, presence: true
end

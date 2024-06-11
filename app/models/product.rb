class Product < ApplicationRecord
  belongs_to :category
  belongs_to :profile

  has_many :reviews, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
  has_many_attached :images
  has_and_belongs_to_many :wishlists

  accepts_nested_attributes_for :category, reject_if: :all_blank

  validates :name, :description, :price, :category_id, :profile_id, presence: true
end

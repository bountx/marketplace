class Profile < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :products, dependent: :destroy
end

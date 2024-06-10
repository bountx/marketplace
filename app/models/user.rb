class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :wishlist, dependent: :destroy
  has_one :purchase_history, dependent: :destroy

  after_create :create_profile
  after_create :create_cart
  after_create :purchase_history
  accepts_nested_attributes_for :profile

  private

  def create_cart
    Cart.create(user: self) unless cart
  end
end

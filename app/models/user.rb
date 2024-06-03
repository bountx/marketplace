class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :cart, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :products, dependent: :destroy

  after_create :create_profile
  after_create :create_cart

  private

  def create_cart
    Cart.create(user: self) unless cart
  end
end

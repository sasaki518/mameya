class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  has_many :rooms
  
         
  validates :name, presence: true
  validates :name, length: { maximum: 20 }, if: :name
  validates :address, length: { maximum: 50 }, if: :address
  validates :phonenumber, numericality: { maximum: 11, only_integer: true }, if: :phonenumber
  validates :description, length: {maximum: 200 }, if: :description
  
  has_one_attached :shop_image
  
  
  
end

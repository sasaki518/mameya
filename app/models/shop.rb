class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :items
  has_many :rooms
  
         
  validates :shopname, presence: true, length: { in: 1..20 }, if: :shopname
  validates :address, length: { in: 10..50 }, if: :address
  validates :phonenumber, length: { in: 5..15 }, numericality: { only_integer:true }, if: :phonenumber
  validates :description, length: {maximum: 200 }, if: :description
  
  has_one_attached :shop_image
  
  
  
end

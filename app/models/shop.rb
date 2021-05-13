class Shop < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         
  validates :shopname, presence: true, length: { in: 1..20 }
  validates :address, presence: true, length: { in: 10..50 }
  validates :phonenumber, presence: true, length: { in: 5..15 }, numericality: { only_integer:true }
  validates :description, length: {maximum: 200 }
  
end

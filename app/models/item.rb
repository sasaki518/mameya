class Item < ApplicationRecord
    
  belongs_to :shop
  has_many :cart_items
  
  
    
  validates :name, presence: true, length: { maximum: 50 }
  validates :description, length: {maximum: 200}
  validates :price, presence: true, numericality: { maximum: 10000, only_integer: true}
  validates :gram, presence: true, numericality: { maximum: 2000, only_integer: true}
  validates :roasting, presence: true, numericality: { in: 1..5, only_integer: true}
  validates :sourness, presence: true, numericality: { in: 1..5, only_integer: true}
  validates :bitterness, presence: true, numericality: { in: 1..5, only_integer: true}
  validates :aroma, presence: true, numericality: { in: 1..5, only_integer: true}
  validates :body, presence: true, numericality: { in: 1..5, only_integer: true}
  validates :aftertaste, presence: true, numericality: { in: 1..5, only_integer: true}
  
    has_one_attached :image
end

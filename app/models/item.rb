class Item < ApplicationRecord
    
  validates :itemname, presence: true
  validates :description, length: {maximum: 200}
  validates :price, presence: true
  validates :gram, presence: true
  validates :roasting, presence: true
  validates :sourness, presence: true
  validates :bitterness, presence: true
  validates :aroma, presence: true
  validates :body, presence: true
  validates :aftertaste, presence: true
  validates :image, presence: true
  
    has_one_attached :image
end

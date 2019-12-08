class Category < ApplicationRecord
  validates :name, presence: true

  has_many :products
  has_many :brands, through :brand_categorys
  has_many :brand_categorys
end

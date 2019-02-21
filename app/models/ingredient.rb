class Ingredient < ApplicationRecord
  has_many :doses
  belongs_to :ingredient
  belongs_to :cocktail
  has_many :cocktails, through: :doses
end

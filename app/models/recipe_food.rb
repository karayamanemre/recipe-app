class RecipeFood < ApplicationRecord
  belongs_to :recipe
  belongs_to :food

  validates :quantity, presence: true, numericality: { only_integer: true, greater_or_equal_to: 0 }
  validates :recipe, presence: true
  validates :food, presence: true
end

class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', class_name: 'User'
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods, dependent: :destroy

  validates :name, presence: true, length: { minimum: 5 }
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true
  validates :user, presence: true

  def total_food_items
    recipe_foods.count
  end

  def total_price_for_food_items
    sum = 0
    recipe_foods.each do |item|
      sum += item.quantity * item.food.price
    end
    sum
  end
end

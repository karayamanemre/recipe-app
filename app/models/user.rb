class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :recipes, foreign_key: 'user_id', dependent: :destroy
  has_many :foods, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :encrypted_password, presence: true

  def shopping_list(recipe)
    recipe = Recipe.find(recipe.id)
    recipe_foods = RecipeFood.where(recipe_id: recipe.id).includes(:food)
    missing_foods = []
    total_val = 0
    total_ingredients = 0

    food_quantities = Food.where(id: recipe_foods.map(&:food_id)).pluck(:id, :quantity).to_h

    recipe_foods.each do |ingredient|
      food_quantity = food_quantities[ingredient.food_id]
      next if food_quantity && (ingredient.quantity <= food_quantity)

      total_val += (ingredient.quantity - food_quantity.to_i) * ingredient.food.price
      total_ingredients += 1
      missing_foods << ingredient
    end

    [total_ingredients, total_val, missing_foods]
  end
end

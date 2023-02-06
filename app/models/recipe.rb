class Recipe < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id' ,class_name: 'User'
  has_many :foods, through: :recipe_foods, dependent: :destroy
  has_many :recipe_foods

  validates :name, presence: true, length: { minimum: 5 }
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true
  validates :user, presence: true
end

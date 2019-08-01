class Recipe < ApplicationRecord
  belongs_to :user
  has_many :steps, class_name: 'RecipeStep', dependent: :destroy
end

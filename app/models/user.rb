class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :recipes

  def owns?(recipe)
  	recipe.user_id == id
  end
end

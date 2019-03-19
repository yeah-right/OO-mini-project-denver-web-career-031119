class Recipe
  @@all = []

  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def self.most_popular
    self.all.max_by do |recipe|
      RecipeCards.all.select do |rc|
        rc.recipe == recipe
      end
    end.count
  end

  def users
    RecipeCard.all.select do |recipecard|
      recipecard.recipe == self
    end.map do |recipe|
      recipe.user
    end
  end

  def ingredients
    RecipeIngredient.all.select do |ingredient|
      ingredient.recipe == self
    end.map do |ri|
      ri.ingredient
    end
  end

  def add_ingredient(ingredient_arr)
    ingredient_arr.each do |ingredient|
      RecipeIngredient.new(ingredient, self)
    end
  end

  def allergens
    Allergen.all.map do |allergen|
      allergen.ingredient
    end
  end
end

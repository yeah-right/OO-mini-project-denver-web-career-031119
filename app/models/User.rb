class User
  @@all = []
  attr_reader :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def recipes
    RecipeCard.all.select do |rc|
      rc.user == self
    end.select do |rcv2|
      rcv2.recipe
    end
  end

  def add_recipe_card(date, rating, recipe)
    RecipeCard.new(date, rating, self, recipe)
  end

  def declare_allergen(ingredient)
    Allergen.new(self, ingredient)
  end

  def allergens
    Allergen.all.select do |allergen|
      allergen.user == self
    end.map do |av2|
      av2.ingredient
    end
  end

  def top_three_recipes
    RecipeCard.all.select do |card|
      card.user == self
    end.sort_by do |recipe|
      recipe.rating
    end.reverse().first(3)
  end

  def most_recent_recipe
    RecipeCard.all.select do |card|
      card.user == self
    end.sort_by do |recipe|
      recipe.date
    end.reverse().first()
  end
end

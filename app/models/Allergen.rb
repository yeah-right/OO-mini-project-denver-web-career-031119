class Allergen
  @@all = []
  attr_reader :ingredient, :user

  def initialize(user, ingredient)
    @ingredient = ingredient
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end
end

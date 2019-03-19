class Ingredient
  @@all = []

  def initialize(ingredient)
    @ingredient = ingredient
  end

  def self.all
    @@all
  end

  def self.most_common_allergen
    self.all.max_by do |ingredient|
      Allergen.all.select do |allergen|
        allergen.ingredient == ingredient
      end.count
    end
  end
end


# # return the ingredient instance that the highest number of users are allergic to
# def self.most_common_allergen
#   # Use max_by to select the 'maximum' element as determined by a block
#   @@all.max_by do |ingredient|
#     # get all allergens which include this ingredient and return a count
#     Allergen.all.select { |allergen| allergen.ingredient == ingredient }.count
#   end
# end

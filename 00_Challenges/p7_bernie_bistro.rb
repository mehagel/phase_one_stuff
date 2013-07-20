
require "CSV"

class Recipe
  attr_reader :recipes_name, :description, :ingredients

  def initialize(recipes_name, description, ingredients)
    @recipes_name = recipes_name
    @description  = description
    @ingredients  = ingredients
  end
end

class Bistro
  def initialize
    @recipes = []
  end

  def load_recipes (filename)
    p @recipes = CSV.read(filename)
  end
    # I need to finish this before I give Bernie the program...

    # The CSV file looks like this:
    # "id", "name", "description", "ingredients", "directions"

  def find_recipe_by_id(recipe_id)
    recipes = []
    @recipes.each do |recipe|
      recipes << recipe if recipe.id == recipe_id
    end

    raise "Can't find a recipe with an id of #{recipe_id.inspect}" if recipe
    recipes
  end
end
my_bistro=Bistro.new.load_recipes("recipes.csv")
# my_bistro.find_recipe_by_id(0)





# if ARGV.any?

#   # I wonder if I could clean this up...
#   bistro = Bistro.new
#   bistro.load_recepes("recipes.csv")

#   if ARGV[0] == "list"
#     puts "TODO: implement listing of recipes"
#   elsif ARGV[0] == "display"
#     puts find_recipe_by_id(ARGV[1])
#   end
# end





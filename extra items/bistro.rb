require 'csv'

class Recipe
  attr_reader :id, :name, :description, :ingredients, :directions
  
    def initialize(args)
      @id           = args[:id]
      @name         = args[:name]
      @description  = args[:description]
      @ingredients  = args[:ingredients]
      @directions   = args[:directions]
    end

    def recipe_page
     puts "#{@id} - #{@name}\n#{@description}\n Ingredients:\n #{@ingredients}\n\ Preperation:\n #{@directions}"
    end
end

#############################################################################
class Bistro 

  attr_reader :recipes

  def initialize(filename)
    @filename = filename
    @recipes =  @recipes || []
  end

  def load_recipes
    CSV.foreach(@filename, :headers => true, :header_converters => :symbol) do |row|
      @recipes << Recipe.new(row)
    end
  end

  def display_recipes
     @recipes.each {|recipe| puts "#{recipe.id.to_s}. #{recipe.name.to_s}"}
  end

  def sort_recipes
    arr = @recipes.sort_by{|recipe| recipe.name}
    arr.each_with_index do|a, index| 
    puts "#{index+1}. #{a.name}"
    end
  end

  def find_recipe_by_id(recipe_id)
    @recipes.each do |recipe| 
      if recipe.id == recipe_id.to_s
        recipe.recipe_page
      end
    end
  end
end

if ARGV.any?

  bistro = Bistro.new("recipes.csv")
  bistro.load_recipes

  if ARGV[0] == "list"
    bistro.display_recipes
  elsif ARGV[0] == "find"
    bistro.find_recipe_by_id(ARGV[1].to_i)
  elsif ARGV[0] == "sort"
    bistro.sort_recipes
  end
end

# bistro = Bistro.new('recipes.csv')
# bistro.load_recipes
# bistro.display_recipes
# puts
# bistro.sort_recipes
# puts
# bistro.find_recipe_by_id(1)

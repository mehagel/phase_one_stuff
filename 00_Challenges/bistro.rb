require 'csv'

class Recipe
  attr_reader :id, :name, :description, :ingredients, :directions
  
  def initialize(args)
    @id         = args[:id]
    @name       = args[:name]
    @description= args[:description]
    @ingredients= args[:ingredients]
    @directions = args[:directions]
  end 

    def to_s
      # puts "#{@id} #{@name}"
      # puts "#{@ingredients}"
      # puts "#{@description}"
      # puts "#{@directions}"
      # puts
  
     end 

     def recipe_page
      puts "#{@id}  #{@name}\n#{@description}\n Ingredients:\n#{@ingredients}\n Prep:\n#{@directions}"
     end
end

##############################

class Bistro

  attr_reader :recipes

  def initialize(filename)
    @filename = filename
    @recipes = []

  end

  def load_recipes
    @recipes = []
    CSV.foreach(@filename, :headers => true, :header_converters => :symbol) do |row|
      @recipes << Recipe.new(row)
    end
    puts @recipes
  end

  def display_recipes
    @recipes.each do |recipe|
      recipe.to_s
    end
  end

  def sort_recipes
    @recipes.sort_by {|recipe| recipe.name}.to_s
  end

  def find_recipe_by_id(recipe_id)

    @recipes.each do |recipe|
       recipe.recipe_page if recipe.id == recipe_id.to_s
    end

  end
end

bistro = Bistro.new('recipes.csv')

if ARGV.any?
  bistro = Bistro.new("recipes.csv")
  bistro.load_recipes

  if ARGV[0] == "list"
    bistro.display_recipes
    puts "TODO: implement listing of recipes"
  elsif ARGV[0] == "display"
    puts bistro.find_recipe_by_id(ARGV[1])
  end
end

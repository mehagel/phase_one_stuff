require_relative('bistro')

bistro = Bistro.new('recipes.csv')
bistro.load_recipes
bistro.display_recipes
bistro.sort_recipes
bistro.find_recipe_by_id(2)


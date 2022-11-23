require_relative './recipes'
class RecipeRepository 

    def all 
        recipe_list = []
        sql = "SELECT id, name, time, rating FROM recipes"
        result_set = DatabaseConnection.exec_params(sql, [])
        result_set.each do |recipe| 
            recipe_choice = Recipe.new
            recipe_choice.id = recipe['id']
            recipe_choice.name = recipe['name']
            recipe_choice.time = recipe['time']
            recipe_choice.rating = recipe['rating']
    
            recipe_list << recipe_choice
        end 
        #Executes following SQL query:
        #SELECT id, name, time, rating FROM recipes
        # Returns array of recipe objects
        return recipe_list
    end 

    def find(id)
        #Executes following SQL query:
        #SELECT id, name, time, rating FROM recipes WHERE id = $1
        #Returns a single object 
        sql = 'SELECT id, name, time, rating FROM recipes WHERE id = $1;'

        params = [id]
    
        results_set = DatabaseConnection.exec_params(sql, params)
        result = results_set[0]
        chosen_recipe = Recipe.new
        chosen_recipe.id = result['id']
        chosen_recipe.name = result['name']
        chosen_recipe.time = result['time']
        chosen_recipe.rating = result['rating']
        
        return chosen_recipe
    end  
end 
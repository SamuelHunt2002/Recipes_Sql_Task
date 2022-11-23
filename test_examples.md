repo = RecipesRepository.new()
recipes = repo.all 
recipes.length = 3 
recipes[0].id = 1
recipes[0].name = Muffin
recipes[0].time = 30
recipes[0].rating = 5
recipes[2].name = Soup
recipes[1].rating = 3 

---
repo = RecipesRepository.new()
recipe = repo.find(1)
recipe.id = 1
recipe.name = Muffin
recipe.itme = 30 
recipe.rating = 5

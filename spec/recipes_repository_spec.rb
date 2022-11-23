require "recipes_repository"

def reset_students_table
  seed_sql = File.read("spec/seeds.sql")
  connection = PG.connect({ host: "127.0.0.1", dbname: "recipes_directory_test" })
  connection.exec(seed_sql)
end

describe RecipeRepository do
  before(:each) do
    reset_students_table
  end

  it "Returns all the objects in a list, and lets me look through them" do
    repo = RecipeRepository.new()
    recipes = repo.all
    expect(recipes.length).to eq 3
    expect(recipes[0].id).to eq "1"
    expect(recipes[0].name).to eq "Muffin"
    expect(recipes[0].time).to eq "30"
    expect(recipes[0].rating).to eq "5"
    expect(recipes[2].name).to eq "Soup"
    expect(recipes[1].rating).to eq "3"
  end

  # (your tests will go here).

  it "Returns a single test result" do
    repo = RecipeRepository.new()
    recipe = repo.find(1)
    expect(recipe.id).to eq "1"
    expect(recipe.name).to eq "Muffin"
    expect(recipe.time).to eq "30"
    expect(recipe.rating).to eq "5"
  end

  it "Returns a single test result from a later selection" do
    repo = RecipeRepository.new()
    recipe = repo.find(3)
    expect(recipe.id).to eq "3"
    expect(recipe.name).to eq "Soup"
    expect(recipe.time).to eq "45"
    expect(recipe.rating).to eq "2"
  end
end

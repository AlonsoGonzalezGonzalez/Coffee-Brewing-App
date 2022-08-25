import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';

//this is a coffee data
CoffeeRecipe makeSweetMariasRecipe() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 30),
    RecipeStep("Cover and wait", 90),
    RecipeStep("Stir", 15),
    RecipeStep("Cover and wait", 75),
    RecipeStep("Stir", 15),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Sweet Maria's",
      22,
      360,
      "finely ground coffee",
      "The original recipe: makes one delicious cup",
      steps);
  return recipe;
}

CoffeeRecipe makePTs() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water in circles to bloom", 10),
    RecipeStep("Cover and wait", 30),
    RecipeStep("Add 325g water in circles", 30),
    RecipeStep("Cover and drain", 180),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "PT's",
      25,
      375,
      "medium-course ground coffee",
      "The original recipe: makes one delicious kansas style cup",
      steps);
  return recipe;
}

CoffeeRecipe makeTexasCoffeeSchool() {
  List<RecipeStep> steps = [
    RecipeStep("Add 100g water to bloom", 20),
    RecipeStep("Stir", 30),
    RecipeStep("Add 240g water", 30),
    RecipeStep("Cover and wait", 180),
    RecipeStep("Stir", 10),
    RecipeStep("Cover and wait", 150),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Texas Coffee School",
      24,
      340,
      "Course ground coffee",
      "The original recipe: makes one delicious cup texas style cup",
      steps);
  return recipe;
}

CoffeeRecipe makeHomegrounds() {
  List<RecipeStep> steps = [
    RecipeStep("Add 30g water to bloom", 40),
    RecipeStep("Stir", 10),
    RecipeStep("Add 240g water", 30),
    RecipeStep("Cover and wait", 150),
  ];
  CoffeeRecipe recipe = CoffeeRecipe(
      "Homegrounds",
      22,
      342,
      "Medium-fine ground coffee",
      "The original recipe: makes one delicious homemade cup",
      steps);
  return recipe;
}

List<CoffeeRecipe> getAllRecipes() {
  return [
    makeSweetMariasRecipe(),
    makePTs(),
    makeTexasCoffeeSchool(),
    makeHomegrounds()
  ];
}

class CoffeeData {
  static List<CoffeeRecipe> loadRecipes() {
    return getAllRecipes();
  }
}

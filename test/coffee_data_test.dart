//Test that the load recipes gives you the data you expect
//this should be dependent on the recipes that you actually want to have in the app

import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';

void main() {
  test('loadRecipes should give back the recipes in my app', () {
    List<CoffeeRecipe> recipes = CoffeeData.loadRecipes();

    // add whatever tests help give you confidence

    //Sweet Maria's
    expect(recipes[0], isA<CoffeeRecipe>());
    expect(recipes[0].name, "Sweet Maria's");
    expect(recipes[0].steps, isA<List<RecipeStep>>());
    expect(recipes[0].grindSize, "finely ground coffee");
    expect(recipes[0].coffeeVolumeGrams, 22);
    expect(recipes[0].waterVolumeGrams, 360);
    expect(
        recipes[0].miscDetails, "The original recipe: makes one delicious cup");

    //PT's
    expect(recipes[1], isA<CoffeeRecipe>());
    expect(recipes[1].name, "PT's");
    expect(recipes[1].steps, isA<List<RecipeStep>>());
    expect(recipes[1].grindSize, "medium-course ground coffee");
    expect(recipes[1].coffeeVolumeGrams, 25);
    expect(recipes[1].waterVolumeGrams, 375);
    expect(recipes[1].miscDetails,
        "The original recipe: makes one delicious kansas style cup");

    //Texas Coffee School
    expect(recipes[2], isA<CoffeeRecipe>());
    expect(recipes[2].name, "Texas Coffee School");
    expect(recipes[2].steps, isA<List<RecipeStep>>());
    expect(recipes[2].grindSize, "Course ground coffee");
    expect(recipes[2].coffeeVolumeGrams, 24);
    expect(recipes[2].waterVolumeGrams, 340);
    expect(recipes[2].miscDetails,
        "The original recipe: makes one delicious cup texas style cup");

    //Homegrounds
    expect(recipes[3], isA<CoffeeRecipe>());
    expect(recipes[3].name, "Homegrounds");
    expect(recipes[3].steps, isA<List<RecipeStep>>());
    expect(recipes[3].grindSize, "Medium-fine ground coffee");
    expect(recipes[3].coffeeVolumeGrams, 22);
    expect(recipes[3].waterVolumeGrams, 342);
    expect(recipes[3].miscDetails,
        "The original recipe: makes one delicious homemade cup");
  });
}

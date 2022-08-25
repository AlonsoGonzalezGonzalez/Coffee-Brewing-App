import 'recipe_step.dart';

class CoffeeRecipe {
  String name;
  int coffeeVolumeGrams;
  String grindSize;
  int waterVolumeGrams;
  String miscDetails;
  List<RecipeStep> steps;

  CoffeeRecipe(name, coffeeVolumeGrams, waterVolumeGrams, grindSize,
      miscDetails, steps) {
    //add any rules to reject invalid values
    //for example, reject negative gram amounts

    //throw an error if name is not a string
    if (name is! String) {
      throw ArgumentError();
    } else {
      this.name = name;
    }

    //throw an error if grams are negative
    if (coffeeVolumeGrams < 0) {
      throw ArgumentError();
    } else {
      this.coffeeVolumeGrams = coffeeVolumeGrams;
    }

    //throws an error if grams of water are negative
    if (waterVolumeGrams < 0) {
      throw ArgumentError();
    } else {
      this.waterVolumeGrams = waterVolumeGrams;
    }
    //throws an error if grindSize is not a string
    if (grindSize is! String) {
      throw ArgumentError();
    } else {
      this.grindSize = grindSize;
    }

    //throws an error if detail is not a string
    if (miscDetails is! String) {
      throw ArgumentError();
    } else {
      this.miscDetails = miscDetails;
    }

    //throws an error if steps is not an array
    if (steps is! List<RecipeStep>) {
      throw ArgumentError();
    } else {
      this.steps = steps;
    }
  }

//helper function that adds the time of every step
  int total() {
    int totalTime = 0;

    for (int i = 0; i < steps.length; i++) {
      totalTime += steps[i].time;
    }

    return totalTime;
  }
}

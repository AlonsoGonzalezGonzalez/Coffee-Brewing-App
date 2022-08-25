import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 5),
    RecipeStep("Cover and wait", 15),
    RecipeStep("Stir", 30),
    RecipeStep("Cover and wait", 25),
    RecipeStep("Stir", 15),
  ];
  test('creates a valid coffee recipe', () {
    //make a coffee recipe

    var test = CoffeeRecipe(
        "test recipe", 22, 360, 'finely ground coffee', "testing...", steps);
    //check that it has the right data
    expect(test.name, "test recipe");
    expect(test.coffeeVolumeGrams, 22);
    expect(test.waterVolumeGrams, 360);
    expect(test.grindSize, "finely ground coffee");
    expect(test.miscDetails, "testing...");
    expect(test.steps.length, 5);
  });

  //how do we test rejecting invalid coffee recipes? #1 parameter
  test('throw ArgumentError when the name of the recipe is not a string', () {
    expect(
        () =>
            CoffeeRecipe(0, 22, 360, "finely ground coffee", "testing", steps),
        throwsArgumentError);
  });

  //throw an error when coffee grams are negative #2 parameter
  test('throw ArgumentError when coffee grams are negative', () {
    expect(
        () => CoffeeRecipe(
            "test recipe", -1, 360, "finely ground coffee", "testing", steps),
        throwsArgumentError);
  });

  //throw an error when water grams are negative #3 parameter
  test('throw ArgumentError when water grams are negative', () {
    expect(
        () => CoffeeRecipe(
            "test recipe", 22, -1, "finely ground coffee", "testing", steps),
        throwsArgumentError);
  });

  //throw an error when grindSize is not a string #4 parameter
  test('throw ArgumentError when grindSize is not a string', () {
    expect(() => CoffeeRecipe("test recipe", 22, 360, 0, "testing", steps),
        throwsArgumentError);
  });

  //throw an error when detail is not a string #5 parameter
  test('throw ArgumentError when detail is not a string', () {
    expect(
        () => CoffeeRecipe(
            "test recipe", 22, 360, "finely ground coffee", 0, steps),
        throwsArgumentError);
  });

  //throw an error when steps is not a List<RecipeSteps> #6 parameter
  test('throw ArgumentError when steps is not a List<RecipeSteps>', () {
    expect(() => CoffeeRecipe(0, 22, 360, "finely ground coffee", "testing", 0),
        throwsArgumentError);
  });
}

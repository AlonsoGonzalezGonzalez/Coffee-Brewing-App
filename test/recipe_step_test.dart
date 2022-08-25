import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:test/test.dart';

void main() {
  test('creates a valid recipe step', () {
    //make a recipe step
    var step = RecipeStep("Add 360g of water", 10);

    //check that it has the right data
    expect(step.text, "Add 360g of water");
    expect(step.time, 10);
  });

  //how do we test rejecting invalid recipe steps?
  test('throw ArgumentError when time is negative', () {
    expect(() => RecipeStep('Add 360g of water', -1), throwsArgumentError);
  });

  test('throw ArgumentError when text is not a string', () {
    expect(() => RecipeStep(0, 0), throwsArgumentError);
  });
}

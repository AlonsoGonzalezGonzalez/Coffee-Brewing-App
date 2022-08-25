// Imports the Flutter Driver API.

import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });
  group('Happy paths', () {
    // First, define the Finders and use them to locate widgets from the
    // test suite. Note: the Strings provided to the `byValueKey` method must
    // be the same as the Strings we used for the Keys in step 1.
    //final coffeeRecipesTextFinder = find.byValueKey('coffee-recipes');

    /*
         Given that I am on the recipe selection screen
         When I tap "Sweet Maria's"
         Then I should see "Sweet Maria's"
         Then I should see "22g - finely ground coffee"
         Then I should see "360g - water"
         Then I should see "Total: 1:10"
         And I tap on the back button
         Then I should see "Coffee Recipes"
        */
    test(
        "Should see Sweet Maria's information when tapping on sweet marias button",
        () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      //expect(await driver.getText(coffeeRecipesTextFinder), "Coffee Recipes");
      final coffee = find.byValueKey("coffee-recipes");
      final sw = find.byValueKey("sweetMariasbutton");
      final sw1 = find.byValueKey("sweet");
      final grams = find.byValueKey("grams");
      final water = find.byValueKey("water");
      final detail = find.byValueKey("detail");
      final total = find.byValueKey("total");
      final back = find.byValueKey("back");

      expect(await driver.getText(coffee), "Coffee Recipes");
      await driver.tap(sw);
      expect(await driver.getText(sw1), "Sweet Maria's");
      expect(await driver.getText(grams), "22g - finely ground coffee");
      expect(await driver.getText(water), "360g - water");
      expect(await driver.getText(detail),
          "The original recipe: makes one delicious cup");
      expect(await driver.getText(total), "Total: 0:09");
      await driver.tap(back);
      expect(await driver.getText(coffee), "Coffee Recipes");
    });

    /*
         Given that I am on the recipe selection screen
         When I tap "PT's"
         Then I should see "PT's"
         Then I should see "25g - medium-course ground coffee"
         Then I should see "375g - water"
         Then I should see "Total: 0:00"
         And I tap on the back button
         Then I should see "Coffee Recipes"
        */
    test("Should see PTs information when tapping on PTs button", () async {
      final coffee = find.byValueKey("coffee-recipes");
      final pts = find.byValueKey("PTsbutton");
      final pts1 = find.byValueKey("sweet");
      final grams = find.byValueKey("grams");
      final water = find.byValueKey("water");
      final detail = find.byValueKey("detail");
      final total = find.byValueKey("total");
      final back = find.byValueKey("back");

      expect(await driver.getText(coffee), "Coffee Recipes");
      await driver.tap(pts);
      expect(await driver.getText(pts1), "PT's");
      expect(await driver.getText(grams), "25g - medium-course ground coffee");
      expect(await driver.getText(water), "375g - water");
      expect(await driver.getText(detail),
          "The original recipe: makes one delicious kansas style cup");
      expect(await driver.getText(total), "Total: 0:08");
      await driver.tap(back);
      expect(await driver.getText(coffee), "Coffee Recipes");
    });

    /*
         Given that I am on the recipe steps screen
         When the steps are completed
         Then I should see "enjoy your amazing handmade coffee"
         And I tap the done button
         Then I should see "Coffee Recipes"
        */
    test("when the steps are completed, we can go to the done screen",
        () async {
      final coffee = find.byValueKey("coffee-recipes");
      final sw = find.byValueKey("sweetMariasbutton");
      final sw1 = find.byValueKey("sweet");
      final start = find.byValueKey("start");
      final remaining = find.byValueKey("remaining");
      final current = find.byValueKey("current");
      final enjoy = find.byValueKey("enjoy");
      final done = find.byValueKey("done");

      expect(await driver.getText(coffee), "Coffee Recipes");
      await driver.tap(sw);
      expect(await driver.getText(sw1), "Sweet Maria's");
      await driver.tap(start);
      expect(await driver.getText(remaining), "5");
      expect(await driver.getText(current), "Add 360g water");
      await Future.delayed(const Duration(seconds: 6), () {});
      expect(await driver.getText(remaining), "1");
      expect(await driver.getText(current), "Cover and wait");
      expect(
          await driver.getText(enjoy), "enjoy your amazing \n handmade coffee");
      await driver.tap(done);
      expect(await driver.getText(coffee), "Coffee Recipes");
    });
  });

  group('Sad Paths', () {
    /*
         Given that I am on the recipe steps screen of Sweet Marias
         When the remaining time of the step "Add 360g water" has not finished
         Then I should see "Add 360g water"
        */

    test(
        'Can still see current step after time passes and step time has not completed for sweet marias recipe',
        () async {
      final sw = find.byValueKey("sweetMariasbutton");
      final start = find.byValueKey("start");
      final current = find.byValueKey("current");
      final done = find.byValueKey("done");

      await driver.tap(sw);
      await driver.tap(start);
      expect(await driver.getText(current), "Add 360g water");
      await Future.delayed(const Duration(seconds: 2), () {});
      expect(await driver.getText(current), "Add 360g water");
      await Future.delayed(const Duration(seconds: 12), () {});
      await driver.tap(done);
    });

    /*
         Given that I am on the recipe steps screen of PTs
         When the remaining time of the step "Add 50g water in circles to bloom" has not finished
         Then I should see "Add 50g water to bloom"
        */
    test(
        'Can still see current steep after time passes and step time has not completed for PTs recipe',
        () async {
      final pts = find.byValueKey("PTsbutton");
      final start = find.byValueKey("start");
      final current = find.byValueKey("current");
      final done = find.byValueKey("done");

      await driver.tap(pts);
      await driver.tap(start);
      expect(
          await driver.getText(current), "Add 50g water in circles to bloom");
      await Future.delayed(const Duration(seconds: 1), () {});
      expect(
          await driver.getText(current), "Add 50g water in circles to bloom");
      await Future.delayed(const Duration(seconds: 8), () {});
      await driver.tap(done);
    });
  });

  group('Links', () {
    test("Check if the links are there", () async {
      final resources = find.byValueKey("resources");
      final coffee = find.byValueKey("Coffee Notification");
      final grinders = find.byValueKey("Grinder Notification");
      final kettles = find.byValueKey("Kettles Notification");
      final homebrew = find.byValueKey("Homebrew Drippers Notification");

      expect(await driver.getText(resources), "Resources");
      expect(await driver.getText(coffee), "Coffee");
      expect(await driver.getText(grinders), "Grinders");
      expect(await driver.getText(kettles), "Kettles");
      expect(await driver.getText(homebrew), "Homebrew Dripper");
    });
  });
}

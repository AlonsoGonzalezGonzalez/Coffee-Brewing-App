import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_detail_screen.dart';
import 'package:homebrew_dripper/utils/coffee_data.dart';
import 'package:homebrew_dripper/utils/globals.dart' as globals;
import 'package:homebrew_dripper/models/recipe_step.dart';

import 'package:url_launcher/url_launcher.dart';

// also known as the menu selection (coffee recipes or resources)
// this is the fake data test
CoffeeRecipe fakeMarias() {
  List<RecipeStep> steps = [
    RecipeStep("Add 360g water", 5),
    RecipeStep("Cover and wait", 1),
    RecipeStep("Stir", 1),
    RecipeStep("Cover and wait", 1),
    RecipeStep("Stir", 1),
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

// second fake data
CoffeeRecipe fakePTs() {
  List<RecipeStep> steps = [
    RecipeStep("Add 50g water in circles to bloom", 2),
    RecipeStep("Cover and wait", 2),
    RecipeStep("Add 325g water in circles", 2),
    RecipeStep("Cover and drain", 2),
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

List<CoffeeRecipe> fake() {
  return [
    fakeMarias(),
    fakePTs(),
  ];
}

bool temp = globals.testing;
List<CoffeeRecipe> recipes = temp ? fake() : CoffeeData.loadRecipes();

class RecipeSelectionScreen extends StatelessWidget {
  //coffeee recipes

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      // coffee recipes menu
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Divider(
            height: 49,
            color: Colors.transparent,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Coffee Recipes",
                key: Key("coffee-recipes"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Kollektif",
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4C748B)),
              ),
            ],
          ),
          Divider(
            height: 19,
            color: Colors.transparent,
          ),

          Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Container(
                width: 337,
                height: 192,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: Color(0xff4C748B),
                  ),
                  borderRadius: BorderRadius.circular(10),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 47,
                      child: RaisedButton(
                          //key for sweet marias button
                          key: Key("sweetMariasbutton"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailScreen(recipes[0])),
                            );
                          },
                          elevation: 0,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Align(
                                    child: Text(
                                  "Sweet Marias", ///////
                                  //key for notification
                                  key: Key("SweetMarias Notification"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kollektif",
                                    color: Color(0xff4C748B),
                                  ),
                                )),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.chevron_right,
                                      color: Color(0xff4C748B)),
                                )
                              ],
                            ),
                          )),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xff4C748B),
                    ),

                    // select PT
                    Container(
                      height: 47,
                      child: RaisedButton(
                          //key for PT button
                          key: Key("PTsbutton"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailScreen(recipes[1])),
                            );
                          },
                          elevation: 0,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "PT's", /////////
                                  //key for PTs notification
                                  key: Key("PTs Notification"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kollektif",
                                    color: Color(0xff4C748B),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Icon(Icons.chevron_right,
                                      color: Color(0xff4C748B)),
                                )
                              ],
                            ),
                          )),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xff4C748B),
                    ),

                    // select Texas Coffee School
                    Container(
                      height: 47,
                      child: RaisedButton(
                          //key for texas coffee school button
                          key: Key("texascoffeeSchoolbutton"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailScreen(recipes[2])),
                            );
                          },
                          elevation: 0,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Texas Coffee School", ///////
                                  //key for texas coffee school notification
                                  key: Key("TexasCoffeeSchool Notification"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kollektif",
                                    color: Color(0xff4C748B),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xff4C748B),
                                )
                              ],
                            ),
                          )),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xff4C748B),
                    ),

                    // select Homegorunds
                    Container(
                      height: 47,
                      child: RaisedButton(
                          //key for homegrounds button
                          key: Key("homeGorundsbutton"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RecipeDetailScreen(recipes[3])),
                            );
                          },
                          elevation: 0,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Homegrounds", ///////
                                  //key for homegrounds noification
                                  key: Key("HomeGrounds Notification"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kollektif",
                                    color: Color(0xff4C748B),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xff4C748B),
                                )
                              ],
                            ),
                          )),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xff4C748B),
                    ),
                  ],
                ),
              )),
          Divider(
            height: 30,
            color: Colors.transparent,
          ),

          // resources menu
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Resources",
                key: Key("resources"),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Kollektif",
                    fontWeight: FontWeight.bold,
                    color: Color(0xff4C748B)),
              )
            ],
          ),
          Divider(
            height: 16,
            color: Colors.transparent,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Container(
                width: 337,
                height: 192,
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: Color(0xff4C748B),
                  ),
                  borderRadius: BorderRadius.circular(10),
                )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // select coffee
                    Container(
                      height: 47,
                      child: RaisedButton(
                          //key for coffee button
                          key: Key("coffeebutton"),
                          onPressed: () {
                            launch(
                                'https://beanbox.com/'); // link to coffee subscription services
                          },
                          elevation: 0,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Coffee",
                                  /////
                                  //key coffe notification
                                  key: Key("Coffee Notification"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kollektif",
                                    color: Color(0xff4C748B),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xff4C748B),
                                )
                              ],
                            ),
                          )),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xff4C748B),
                    ),

                    // select grinder
                    Container(
                      height: 47,
                      child: RaisedButton(
                          //key for grinder button
                          key: Key("grinderbutton"),
                          onPressed: () {
                            launch(
                                'https://www.nbcnews.com/select/shopping/best-coffee-grinders-ncna1275072'); // link to the top best grinders
                          },
                          elevation: 0,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Grinders", /////
                                  //key for grinder notification
                                  key: Key("Grinder Notification"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kollektif",
                                    color: Color(0xff4C748B),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xff4C748B),
                                )
                              ],
                            ),
                          )),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xff4C748B),
                    ),

                    // select kettles
                    Container(
                      height: 47,
                      child: RaisedButton(
                          //key for kettles button
                          key: Key("kettlesbutton"),
                          onPressed: () {
                            launch(
                                'https://unclutterer.com/best-pour-over-coffee-kettle/'); // link to the top best kettles
                          },
                          elevation: 0,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Kettles", /////
                                  //key for kettles notification
                                  key: Key("Kettles Notification"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kollektif",
                                    color: Color(0xff4C748B),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xff4C748B),
                                )
                              ],
                            ),
                          )),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xff4C748B),
                    ),

                    // select homebrew dripper
                    Container(
                      height: 47,
                      child: RaisedButton(
                          //key for homebrew dripper button
                          key: Key("homebrewDripperbutton"),
                          onPressed: () {
                            launch(
                                'https://nybestreviews.com/best-pour-over-coffee-dripper/'); // link to the top best homebrew drippers
                          },
                          elevation: 0,
                          color: Colors.transparent,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Homebrew Dripper", /////
                                  //key for homebrew drippers notification
                                  key: Key("Homebrew Drippers Notification"),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: "Kollektif",
                                    color: Color(0xff4C748B),
                                  ),
                                ),
                                Icon(
                                  Icons.chevron_right,
                                  color: Color(0xff4C748B),
                                )
                              ],
                            ),
                          )),
                    ),
                    Divider(
                      height: 0,
                      thickness: 0,
                      indent: 0,
                      endIndent: 0,
                      color: Color(0xff4C748B),
                    ),
                  ],
                ),
              ))
        ],
      ),
    ));
  }
}

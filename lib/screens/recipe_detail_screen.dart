//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';
import 'package:homebrew_dripper/screens/recipe_steps_screen.dart';
import '../models/recipe_step.dart';
import '../models/coffee_recipe.dart';

extension on Duration {
  String format() => '$this'.substring(2, 7);
}

extension on Duration {
  String format1() => '$this'.substring(3, 7);
}

class RecipeDetailScreen extends StatelessWidget {
  CoffeeRecipe recipe;

  RecipeDetailScreen(this.recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff4C748B),
            ),
            key: Key("back"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RecipeSelectionScreen()),
              );
            },
          )),
      body: ListView(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xff4c748b), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                SizedBox(height: 10),
                Text(
                  "${recipe.name}",
                  key: Key("sweet"),
                  style: TextStyle(
                      fontFamily: 'Kollektif',
                      fontSize: 18,
                      letterSpacing: 2,
                      color: Color(0xff4c748b)),
                ),
                SizedBox(height: 10),
                Divider(
                    thickness: 1,
                    color: Color(0xff4C748B),
                    height: 0,
                    indent: 20,
                    endIndent: 20),
                SizedBox(height: 30),
                Text(
                  "${recipe.coffeeVolumeGrams}g - ${recipe.grindSize}",
                  key: Key("grams"),
                  style: TextStyle(
                      fontFamily: 'Kollektif',
                      fontSize: 14,
                      letterSpacing: 2,
                      color: Color(0xff4c748b)),
                ),
                Text(
                  "${recipe.waterVolumeGrams}g - water",
                  key: Key("water"),
                  style: TextStyle(
                      fontFamily: 'Kollektif',
                      fontSize: 14,
                      letterSpacing: 2,
                      color: Color(0xff4c748b)),
                ),
                SizedBox(height: 40),
                Text(
                  "${recipe.miscDetails}",
                  key: Key("detail"),
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontStyle: FontStyle.italic,
                      fontSize: 10,
                      letterSpacing: 2,
                      color: Color(0xff4c748b)),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.only(left: 23, right: 25, bottom: 4, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Steps",
                    style: TextStyle(
                        fontFamily: 'Kollektif',
                        fontSize: 14,
                        letterSpacing: 2,
                        color: Color(0xff4c748b)),
                  ),
                  Text(
                    "Total: " +
                        Duration(seconds: recipe.total()).format1().toString(),
                    key: Key("total"),
                    style: TextStyle(
                        fontFamily: 'Kollektif',
                        fontSize: 12,
                        letterSpacing: 2,
                        color: Color(0xff4c748b)),
                  ),
                ],
              )),
          Divider(
            color: Colors.transparent,
            height: 5,
          ),
          Column(
            children: [
              for (RecipeStep step in recipe.steps)
                Container(
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(29, 0, 9, 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff4c748b), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                              left: 22,
                            ),
                            child: Text(
                              "${step.text}",
                              style: TextStyle(
                                  fontFamily: 'Kollektif',
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: Color((0xff4c748b))),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                              right: 27,
                            ),
                            child: Text(
                              Duration(seconds: step.time).format().toString(),
                              style: TextStyle(
                                  fontFamily: 'Kollektif',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1,
                                  color: Color((0xff4c748b))),
                            )),
                      ],
                    ))
            ],
          ),
          Divider(
            height: 66,
            color: Colors.transparent,
          ),
          Container(
              height: 46,
              width: 280,
              margin: const EdgeInsets.fromLTRB(47, 0, 48, 0),
              child: ElevatedButton(
                key: Key("start"),
                style: ElevatedButton.styleFrom(
                    primary: Color(0xff4c748b),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(10.0),
                    )),
                child: Text(
                  "Start",
                  style: TextStyle(fontSize: 14, fontFamily: 'Montserrat'),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RecipeStepsScreen(recipe)),
                  );
                },
              ))
        ],
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:homebrew_dripper/models/coffee_recipe.dart';
import 'package:homebrew_dripper/models/recipe_step.dart';
import 'package:homebrew_dripper/screens/done_screen.dart';

extension on Duration {
  String format() => '$this'.substring(2, 7);
}

class RecipeStepsScreen extends StatefulWidget {
  CoffeeRecipe recipe;

  RecipeStepsScreen(this.recipe);

  @override
  _RecipeStepsScreenState createState() => _RecipeStepsScreenState();
}

class _RecipeStepsScreenState extends State<RecipeStepsScreen> {
  int currentStep;
  List<RecipeStep> remainingSteps;
  int stepTimeRemaining;
  Timer timer;

  @override
  void initState() {
    super.initState();

    int totalSteps = widget.recipe.steps.length;

    currentStep = 0;
    remainingSteps = widget.recipe.steps;

    //set the starting value of the timer
    stepTimeRemaining = widget.recipe.steps[currentStep].time;

    //make timer that ticks every one seconds
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      // if timer reached zero
      if (stepTimeRemaining < 1) {
        //increase step
        currentStep++;

        //if we finished
        if (currentStep >= totalSteps) {
          //cancel timer
          timer.cancel();

          //navigate to done screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoneScreen()),
          );
        } else {
          //if we did not finish yet
          //adjust the timer
          //reduce the list of remaining steps
          stepTimeRemaining = widget.recipe.steps[currentStep].time;
          remainingSteps = widget.recipe.steps.sublist(currentStep);
          setState(() {});
        }
      } else {
        //adjust time remaining by one
        stepTimeRemaining = stepTimeRemaining - 1;
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    RecipeStep currentRecipeStep = widget.recipe.steps[currentStep];

    return Scaffold(
        backgroundColor: Color(0xff4C748B),
        body: Center(
          child: ListView(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Divider(
                      color: Colors.transparent,
                      height: 40,
                    ),
                    Text(
                      "${stepTimeRemaining}",
                      key: Key("remaining"),
                      style: TextStyle(
                          fontFamily: 'Kollektif',
                          fontSize: 96,
                          fontWeight: FontWeight.normal,
                          color: Color(0xffFFFFFF)),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 40,
                    ),
                    Text(
                      "${currentRecipeStep.text}",
                      key: Key("current"),
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 24,
                        fontFamily: 'Kollektif',
                      ),
                    ),
                    Divider(
                      color: Colors.transparent,
                      height: 60,
                    ),
                  ]),
              Text(
                '     Steps',
                style: TextStyle(
                    fontFamily: 'Kollektif',
                    fontSize: 14,
                    color: Color(0xffFFFFFF)),
              ),
              Divider(color: Colors.transparent),
              for (RecipeStep step in remainingSteps)
                Container(
                    height: 36,
                    width: 337,
                    margin: EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                    ),
                    decoration: step == currentRecipeStep
                        ? BoxDecoration(
                            border: Border.all(
                              width: 3.0,
                              color: Color(0xFFFFFFFF0),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ))
                        : BoxDecoration(
                            border: Border.all(
                              width: 3.0,
                              color: Color(0xff4C748B),
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
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
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1,
                                  color: Color((0xffFFFFFF))),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                              right: 18,
                            ),
                            child: Text(
                              Duration(seconds: step.time).format().toString(),
                              style: TextStyle(
                                  fontFamily: 'Kollektif',
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  letterSpacing: 1,
                                  color: Color((0xffFFFFFF))),
                            )),
                      ],
                    ))
            ],
          ),
        ));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}

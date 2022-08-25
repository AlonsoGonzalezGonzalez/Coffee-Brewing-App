import 'package:flutter/material.dart';
import 'package:homebrew_dripper/screens/recipe_selection_screen.dart';

class DoneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            Container(
              child: Center(
                  child: Text(
                "enjoy your amazing \n handmade coffee",
                key: Key("enjoy"),
                style: TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1,
                  color: Color(0xFF4C748B),
                  fontSize: 18,
                  fontFamily: 'Montserrat',
                ),
              )),
            ),
            Spacer(flex: 1),
            Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                  SizedBox(
                    width: 280,
                    height: 46,
                    child: RaisedButton(
                      key: Key('done'),
                      child: Text("done",
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4C748B),
                            fontSize: 18,
                            fontFamily: 'Montserrat',
                          )),
                      textColor: Color(0xffFFFFFF),
                      color: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecipeSelectionScreen()));
                      },
                    ),
                  )
                ])),
            Divider(height: 25),
          ],
        ),
      ),
    );
  }
}

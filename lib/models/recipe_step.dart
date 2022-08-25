class RecipeStep {
  String text;
  int time;

  RecipeStep(text, time) {
    //add any rules to reject invalid values
    //for example, reject negative seconds
    if (text is! String) {
      throw ArgumentError();
    } else {
      this.text = text;
    }

    if (time < 0) {
      throw ArgumentError();
    } else {
      this.time = time;
    }

    this.text = text;
    this.time = time;
  }
}

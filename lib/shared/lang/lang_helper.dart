class LangHelper {
  static const String newsApp = "newsApp";
  static const String busieness = "busieness";
  static const String sports = "sports";
  static const String science = "science";
  static const String profile = "profile";
  static const String favorite = "favorite";

  static const String up = "up";
  static const String down = "down";
  static const String comment = "comment";
  static const String share = "share";
  static const String comments = "comments";

  static String getLangHelper(String str) {
    return _capitalizeFirstLetter(str
        .split(RegExp(r"(?<=[a-z])(?=[A-Z])"))
        .reduce((a, b) => a + " " + b));
  }

  static String _capitalizeFirstLetter(String s) =>
      s.replaceFirst(s[0], s[0].toUpperCase());
}

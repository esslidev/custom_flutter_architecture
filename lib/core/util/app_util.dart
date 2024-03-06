class AppUtil {
  static String capitalizeFirstLetter(String input) {
    return input.isNotEmpty
        ? input[0].toUpperCase() + input.substring(1)
        : input;
  }

  static double remap(
      double value, double from1, double to1, double from2, double to2) {
    return (value - from1) / (to1 - from1) * (to2 - from2) + from2;
  }
}

class Utils {
  static String replacewh(int height, int width, String url) {
    String finalUrl = url
        .replaceAll('{w}', '${width.toInt()}')
        .replaceAll('{h}bb', '${height.toInt()}');

    return finalUrl;
  }

  static String stringwithdot(String txt, int limit) {
    return txt.length < limit ? txt : txt.substring(0, limit) + "...";
  }
}

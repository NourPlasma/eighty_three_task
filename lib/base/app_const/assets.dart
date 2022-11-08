class AppAssets {
  static String cart = 'cart'.png;
  static String cartTotal = 'cart_total'.png;
  static String favourite = 'favourite'.png;
  static String grocery = 'grocery'.png;
  static String location = 'location'.png;
  static String location2 = 'location_2'.png;
  static String news = 'news'.png;
  static String search = 'search'.png;
  static String border = 'border'.png;
}

extension ImageExt on String {
  String get png => 'assets/icons/$this.png';
  String get svg => 'assets/icons/$this.svg';
  String get jpeg => 'assets/icons/$this.jpeg';
}
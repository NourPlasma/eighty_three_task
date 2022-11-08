import 'package:get/get.dart';

class AppLocalKeys {
  static const String cart = 'cart';
  static const String searchMsg = 'searchMsg';
  static const String categoryExploreMsg = 'categoryExploreMsg';
  static const String dealsMsg = 'dealsMsg';
  static const String grocery = 'grocery';
  static const String news = 'news';
  static const String favorites = 'favorites';
  static const String success = 'success';
  static const String error = 'error';
  static const String seeAll = 'seeAll';
  static const String add = 'add';
  static const String addCartSuccessMsg = 'addCartSuccessMsg';
  static const String addFavSuccessMsg = 'addFavSuccessMsg';
  static const String removeFavSuccessMsg = 'removeFavSuccessMsg';
  static const String addCartErrorMsg = 'addCartErrorMsg';
  static const String cartLimitMsg = 'cartLimitMsg';
  static const String cartLessMsg = 'cartLessMsg';

}

class LocalTranslations extends Translations {
  final enMap = {
    AppLocalKeys.success: 'Success',
    AppLocalKeys.error: 'ُError',
    AppLocalKeys.cart: 'Cart',
    AppLocalKeys.searchMsg: 'Search in thousands of products',
    AppLocalKeys.categoryExploreMsg: 'Explore by Category',
    AppLocalKeys.dealsMsg: 'Deals of the day',
    AppLocalKeys.grocery: 'Grocery',
    AppLocalKeys.news: 'News',
    AppLocalKeys.favorites: 'Favorites',
    AppLocalKeys.seeAll: 'See All',
    AppLocalKeys.addCartSuccessMsg: 'Add To Cart Successfully',
    AppLocalKeys.addCartErrorMsg: 'Item Already In The Cart',
    AppLocalKeys.add: 'Add',
    AppLocalKeys.cartLimitMsg: 'You Can\'t Order More of This Item',
    AppLocalKeys.cartLessMsg: 'You Can\'t Order Less Than This',
    AppLocalKeys.addFavSuccessMsg: 'Add to Favourite Successfully',
    AppLocalKeys.removeFavSuccessMsg: 'Remove from Favourite Successfully',

  };

  final arMap = {
    AppLocalKeys.success: 'تم بنجاح',
  };

  @override
  Map<String, Map<String, String>> get keys => {
        'en': enMap,
        'ar': arMap,
      };
}

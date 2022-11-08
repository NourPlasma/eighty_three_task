import 'package:get_storage/get_storage.dart';

class PrefController {
  GetStorage? _getStorage;

  PrefController() {
    _getStorage = GetStorage();
  }

  // current locale
  String get currentLocale => _getStorage!.read('currentLocale') ?? 'en';
  set currentLocale(String value) => _getStorage!.write('currentLocale', value);

  // current locale
  double get lastCartTotal => _getStorage!.read('lastCartTotal') ?? 0;
  set lastCartTotal(double value) => _getStorage!.write('lastCartTotal', value);

  // favourite items
  List<dynamic> get favouriteItemsIds => _getStorage!.read('favouriteItemsIds') ?? [];
  set favouriteItemsIds(List<dynamic>? value) => _getStorage!.write('favouriteItemsIds', value);

}

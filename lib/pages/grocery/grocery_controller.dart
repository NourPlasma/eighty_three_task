import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:eighty_three_task/base/controllers/local/local_translations.dart';
import 'package:eighty_three_task/base/controllers/pref/pref_controller.dart';
import 'package:eighty_three_task/base/controllers/public_controllers/public_data_controller.dart';
import 'package:eighty_three_task/base/controllers/sql/sql_controller.dart';
import 'package:eighty_three_task/base/models/cart_sql_model.dart';
import 'package:eighty_three_task/base/models/grocery_model.dart';
import 'package:eighty_three_task/pages/cart/cart_controller.dart';
import 'package:get/get.dart' as gt;
import '../../base/app_status/app_status.dart';
import '../../base/controllers/alerts/alerts_controller.dart';
import '../../base/controllers/log/log_controller.dart';
import '../../base/controllers/network/api_controller.dart';
import '../../base/controllers/utils/utils_controller.dart';

class GroceryController extends gt.GetxController {
  //  controllers

  LogController logController = gt.Get.find();
  AlertsController alertsController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  ApiController apiController = gt.Get.find();
  SqlController sqlController = gt.Get.find();
  PrefController prefController = gt.Get.find();
  PublicDataController publicDataController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  AppStatus appStatus = AppStatus.init;

  List<Addresses> addresses = [];

  List<Categories> categories = [];

  List<Deals> deals = [];

  List<OffersBanners> offersBanners = [];

  num categoryTotalCount = 0;

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.red(msg: 'init Grocery controller');
    _loadGrocery();
    super.onInit();
  }

  @override
  void onReady() {
    logController.red(msg: 'ready Grocery controller');
    super.onReady();
  }

  @override
  void onClose() {
    logController.red(msg: 'close Grocery controller');
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  _loadGrocery() async {
    appStatus = AppStatus.loading;
    update();
    await apiController.onLoadGrocery().then((response) {
      GroceryModel groceryModel = GroceryModel.fromJson(json.decode(response));
      addresses = groceryModel.data!.addresses!;
      categories = groceryModel.data!.categories!;
      deals = groceryModel.data!.deals!;
      offersBanners = groceryModel.data!.offersBanners!;
      categoryTotalCount = groceryModel.data!.categoryTotalCount!;
      appStatus = AppStatus.success;
      publicDataController.onUpdateCartData(cartTotal: prefController.lastCartTotal);
      _checkFav();

    }).onError((DioError error, stackTrace) {
      appStatus = AppStatus.failed;
      alertsController.onShowErrorSneakBar(text: error.response.toString());
      update();
    }).timeout(const Duration(seconds: 10), onTimeout: () {
      appStatus = AppStatus.failed;
      alertsController.onShowErrorSneakBar();
      update();
    });
  }

  void onSeeAllPress() {}

  void onAddCartPress({required Deals item}) async {
    if (await _isFoundCart(itemId: item.id!.toInt())) {
      alertsController.onShowErrorSneakBar(
          text: AppLocalKeys.addCartErrorMsg.tr);
    } else {
      sqlController.insert(CartSqlModel(
          image: item.image,
          name: item.name,
          cartQuantity: 1,
          itemId: item.id,
          onePiecePrice: item.discountedPrice,
          quantity: item.quantity,
          type: item.type));
      alertsController.onShowSuccessSneakBar(
          text: AppLocalKeys.addCartSuccessMsg.tr);
      CartController cartController = gt.Get.find();
      cartController.onLoadCart();
    }
  }

  Future<bool> _isFoundCart({required int itemId}) async {
    var loadAll = await sqlController.loadAll();
    var isFound = false;
    for (var element in loadAll) {
      if (element.itemId == itemId) isFound = true;
    }
    return isFound;
  }

  void _checkFav() {
    var favouriteItemsIds = prefController.favouriteItemsIds;
    for (var index = 0; index < deals.length; index++) {
      if (favouriteItemsIds.contains(deals[index].id.toString())) {
        deals[index].isFavourite = true;
      }
    }
    update();

  }

  onFavPress({required int index}) {
    var favouriteItemsIds = prefController.favouriteItemsIds;
    if(deals[index].isFavourite!){
      deals[index].isFavourite = false;
      favouriteItemsIds.remove(deals[index].id.toString());
      alertsController.onShowSuccessSneakBar(
          text: AppLocalKeys.removeFavSuccessMsg.tr);
    }else{
      deals[index].isFavourite = true;
      favouriteItemsIds.add(deals[index].id.toString());
      alertsController.onShowSuccessSneakBar(
          text: AppLocalKeys.addFavSuccessMsg.tr);
    }
    prefController.favouriteItemsIds = favouriteItemsIds;
    update();
  }
}

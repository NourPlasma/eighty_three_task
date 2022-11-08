import 'package:eighty_three_task/base/controllers/local/local_translations.dart';
import 'package:eighty_three_task/base/controllers/pref/pref_controller.dart';
import 'package:eighty_three_task/base/controllers/public_controllers/public_data_controller.dart';
import 'package:eighty_three_task/base/controllers/sql/sql_controller.dart';
import 'package:eighty_three_task/base/models/cart_sql_model.dart';
import 'package:get/get.dart' as gt;
import '../../base/app_status/app_status.dart';
import '../../base/controllers/alerts/alerts_controller.dart';
import '../../base/controllers/log/log_controller.dart';
import '../../base/controllers/network/api_controller.dart';
import '../../base/controllers/utils/utils_controller.dart';

class CartController extends gt.GetxController {
  //  controllers

  LogController logController = gt.Get.find();
  AlertsController alertsController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  SqlController sqlController = gt.Get.find();
  PublicDataController publicDataController = gt.Get.find();
  PrefController prefController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  AppStatus appStatus = AppStatus.init;

  List<CartSqlModel> cartList = [];

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.red(msg: 'init Cart controller');
    onLoadCart();
    super.onInit();
  }

  @override
  void onReady() {
    logController.red(msg: 'ready Cart controller');
    super.onReady();
  }

  @override
  void onClose() {
    logController.red(msg: 'close Cart controller');
    super.onClose();
  }

//***************************************************************************************************************

//  methods

  onLoadCart() async {
    cartList = await sqlController.loadAll();
    double finalPrice = 0;
    for (var element in cartList) {
      var itemPrice = element.cartQuantity! * element.onePiecePrice!.toDouble();
      finalPrice = finalPrice + itemPrice;
    }
    publicDataController.onUpdateCartData(cartTotal: finalPrice);
    prefController.lastCartTotal = finalPrice;
  }

  onAddQuantity({required int index}) {
    var cartListItem = cartList[index];
    if (cartListItem.quantity == cartListItem.cartQuantity) {
      alertsController.onShowErrorSneakBar(text: AppLocalKeys.cartLimitMsg.tr);
    } else {
      cartList[index].cartQuantity = cartListItem.cartQuantity! + 1;
      sqlController.updateItem(cartList[index]);
      var finalPrice = publicDataController.cartTotal.value +
          cartList[index].onePiecePrice!.toDouble();
      publicDataController.onUpdateCartData(
          cartTotal: finalPrice);
      prefController.lastCartTotal = finalPrice;
      update();
    }
  }

  onRemoveQuantity({required int index}) {
    var cartListItem = cartList[index];
    if (cartListItem.cartQuantity == 1) {
      alertsController.onShowErrorSneakBar(text: AppLocalKeys.cartLessMsg.tr);
    } else {
      cartList[index].cartQuantity = cartListItem.cartQuantity! - 1;
      sqlController.updateItem(cartList[index]);

      var finalPrice = publicDataController.cartTotal.value -
          cartList[index].onePiecePrice!.toDouble();
      publicDataController.onUpdateCartData(cartTotal: finalPrice);
      prefController.lastCartTotal = finalPrice;
      update();
    }
  }
}

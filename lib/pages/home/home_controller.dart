import 'package:eighty_three_task/base/controllers/local/local_translations.dart';
import 'package:eighty_three_task/pages/cart/cart_view.dart';
import 'package:eighty_three_task/pages/grocery/grocery_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart' as gt;
import '../../base/app_status/app_status.dart';
import '../../base/controllers/alerts/alerts_controller.dart';
import '../../base/controllers/log/log_controller.dart';
import '../../base/controllers/network/api_controller.dart';
import '../../base/controllers/utils/utils_controller.dart';

class HomeController extends gt.GetxController{
  //  controllers

  LogController logController = gt.Get.find();
  AlertsController alertsController = gt.Get.find();
  UtilsController utilsController = gt.Get.find();
  ApiController apiController = gt.Get.find();

  //***************************************************************************************************************

  //  variables

  AppStatus appStatus = AppStatus.init;
  Widget activeView = GroceryView();
  String activeViewKey = AppLocalKeys.grocery;

  //***************************************************************************************************************

  //  status

  @override
  void onInit() {
    logController.red(msg: 'init Home controller');
    super.onInit();
  }

  @override
  void onReady() {
    logController.red(msg: 'ready Home controller');
    super.onReady();
  }

  @override
  void onClose() {
    logController.red(msg: 'close Home controller');
    super.onClose();
  }


//***************************************************************************************************************

//  methods

  onBottomAppBarIconPress({required String key}){
    switch(key){
      case AppLocalKeys.grocery :
        activeView = GroceryView();
        break;
      case AppLocalKeys.cart :
        activeView = CartView();
        break;
    }
    activeViewKey = key;
    update();
  }


  void onFabButtonPress() {

  }

}

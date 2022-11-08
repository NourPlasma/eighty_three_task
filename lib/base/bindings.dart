import 'package:eighty_three_task/base/controllers/public_controllers/public_data_controller.dart';
import 'package:eighty_three_task/pages/cart/cart_controller.dart';
import 'package:eighty_three_task/pages/grocery/grocery_controller.dart';
import 'package:eighty_three_task/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'controllers/alerts/alerts_controller.dart';
import 'controllers/local/localization_controller.dart';
import 'controllers/log/log_controller.dart';
import 'controllers/network/api_controller.dart';
import 'controllers/pref/pref_controller.dart';
import 'controllers/sql/sql_controller.dart';
import 'controllers/utils/utils_controller.dart';


class MainBindings implements Bindings {
  @override
  void dependencies() {

    //Services
    Get.put(ApiController(),permanent: true);
    Get.put(SqlController(),permanent: true);
    Get.lazyPut(() => PrefController(), fenix: true);
    Get.lazyPut(() => LocalizationController(), fenix: true);
    Get.lazyPut(() => LogController(), fenix: true);
    Get.lazyPut(() => UtilsController(), fenix: true);
    Get.lazyPut(() => AlertsController(), fenix: true);

    //Public Data
    Get.put(PublicDataController(),permanent: true);

    //View
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CartController(), fenix: true);
    Get.lazyPut(() => GroceryController(), fenix: true);

  }
}

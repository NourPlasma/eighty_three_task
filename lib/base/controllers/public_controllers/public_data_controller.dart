import 'package:get/get.dart' as gt;

class PublicDataController extends gt.GetxController {
  gt.RxDouble cartTotal = 0.0.obs;

  onUpdateCartData({double? cartTotal}){
    if (cartTotal != null) this.cartTotal.value = cartTotal;
  }

}

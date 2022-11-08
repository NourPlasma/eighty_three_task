import 'package:eighty_three_task/pages/cart/widgets/cart_list.dart';
import 'package:eighty_three_task/pages/cart/widgets/cart_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'cart_controller.dart';

class CartView extends StatelessWidget {
  final CartController controller = Get.find();

  CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 15.0.w,right: 15.w,top: 32.h),
      child: Column(
        children: const [
          CartText(),
          CartList(),
        ],
      ),
    );
  }
}

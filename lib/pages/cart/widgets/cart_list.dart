import 'package:eighty_three_task/pages/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'cart_list_item.dart';

class CartList extends StatelessWidget {
  const CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (CartController controller) {
      return Expanded(
          child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              scrollDirection: Axis.vertical,
              itemCount: controller.cartList.length,
              itemBuilder: (context, index) {
                return CartListItem(
                  index: index,
                  item : controller.cartList[index],
                  controller: controller,
                );
              }));
    });
  }
}

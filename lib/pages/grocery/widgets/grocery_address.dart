import 'package:eighty_three_task/pages/grocery/grocery_controller.dart';
import 'package:eighty_three_task/pages/grocery/widgets/grocery_address_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroceryAddress extends StatelessWidget {
  final GroceryController controller;

  const GroceryAddress({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        scrollDirection: Axis.horizontal,
        itemCount: controller.addresses.length,
        itemBuilder: (context, index) {
          return GroceryAddressItem(
            address: controller.addresses[index],
          );
        },
      ),
    );
  }
}

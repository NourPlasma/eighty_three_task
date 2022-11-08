import 'package:eighty_three_task/pages/grocery/widgets/grocery_address.dart';
import 'package:eighty_three_task/pages/grocery/widgets/grocery_category.dart';
import 'package:eighty_three_task/pages/grocery/widgets/grocery_deals.dart';
import 'package:eighty_three_task/pages/grocery/widgets/grocery_offer.dart';
import 'package:eighty_three_task/pages/grocery/widgets/grocery_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/app_const/colors.dart';
import '../../base/app_status/app_status.dart';
import 'grocery_controller.dart';

class GroceryView extends StatelessWidget {
  final GroceryController controller = Get.find();

  GroceryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(builder: (GroceryController c) {
      Widget currentWidget = Container();
      switch (controller.appStatus) {
        case AppStatus.init:
          currentWidget = Container();
          break;
        case AppStatus.loading:
          currentWidget = Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  color: AppColors.colorBlack1,
                ),
              ],
            ),
          );
          break;
        case AppStatus.success:
          currentWidget = ListView(
            padding: EdgeInsets.zero,
            children: [
              const GrocerySearch(),
              GroceryAddress(
                controller: controller,
              ),
              GroceryCategory(
                controller: controller,
              ),
              GroceryDeals(
                controller: controller,
              ),
              GroceryOffer(
                controller: controller,
              ),
            ],
          );
          break;
        case AppStatus.failed:
          currentWidget = const Icon(
            Icons.error,
            color: AppColors.colorRed1,
          );
          break;
      }
      return currentWidget;
    });
  }
}

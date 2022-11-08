import 'package:eighty_three_task/base/app_const/colors.dart';
import 'package:eighty_three_task/pages/grocery/grocery_controller.dart';
import 'package:eighty_three_task/pages/grocery/widgets/grocery_deals_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/controllers/local/local_translations.dart';


class GroceryDeals extends StatelessWidget {
   final GroceryController controller;
   const GroceryDeals({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 15.h),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center,children: [
            Text(
              AppLocalKeys.dealsMsg.tr,
              style: TextStyle(
                color: AppColors.colorGrey1,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],),
          SizedBox(height: 5.h,),
          SizedBox(
            height: 120.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.deals.length,
              itemBuilder: (context, index) {
                return GroceryDealsItem(
                  index: index,
                  controller: controller,
                  deal: controller.deals[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

import 'package:eighty_three_task/base/app_const/colors.dart';
import 'package:eighty_three_task/base/controllers/local/local_translations.dart';
import 'package:eighty_three_task/pages/grocery/grocery_controller.dart';
import 'package:eighty_three_task/pages/grocery/widgets/grocery_category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class GroceryCategory extends StatelessWidget {
  final GroceryController controller;
  const GroceryCategory({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 15.h),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center,children: [
            Text(
              AppLocalKeys.categoryExploreMsg.tr,
              style: TextStyle(
                color: AppColors.colorGrey1,
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: controller.onSeeAllPress,
              child: Text(
                '${AppLocalKeys.seeAll.tr} (${controller.categoryTotalCount})',
                style: TextStyle(
                  color: AppColors.colorGrey1,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ],),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 90.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.categories.length,
              itemBuilder: (context, index) {
                return GroceryCategoryItem(
                  category: controller.categories[index],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

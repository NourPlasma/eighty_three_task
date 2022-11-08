import 'package:eighty_three_task/base/app_const/colors.dart';
import 'package:eighty_three_task/base/controllers/local/local_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/app_const/assets.dart';


class GrocerySearch extends StatelessWidget {
   const GrocerySearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
      width: double.infinity,
      height: 45.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.colorGrey7,width: 1),
          color: AppColors.colorGrey6,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(AppAssets.search,width: 18.w,height: 18.h,),
          SizedBox(width: 8.w,),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 5.h),
                  border: InputBorder.none,
                  hintText: AppLocalKeys.searchMsg.tr,
                  hintStyle: TextStyle(
                    color: AppColors.colorGrey1,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                  )
              ),
              style: TextStyle(
                color: AppColors.colorBlack1,
                fontSize: 11.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

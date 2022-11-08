import 'package:cached_network_image/cached_network_image.dart';
import 'package:eighty_three_task/base/app_const/colors.dart';
import 'package:eighty_three_task/pages/grocery/grocery_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class GroceryOffer extends StatelessWidget {
   final GroceryController controller;
   const GroceryOffer({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 15.h),
      width: double.infinity,
      height: 150.h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15).w,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: controller.offersBanners[0].image!,
          progressIndicatorBuilder:
              (context, url, downloadProgress) =>
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    value: downloadProgress.progress,
                    color: AppColors.colorBlack1,
                  ),
                ],
              ),
          errorWidget: (context, url, error) => const Icon(
            Icons.error,
            color: AppColors.colorRed1,
          ),
        ),
      ),
    );
  }
}

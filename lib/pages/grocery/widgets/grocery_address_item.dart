import 'package:cached_network_image/cached_network_image.dart';
import 'package:eighty_three_task/base/app_const/colors.dart';
import 'package:eighty_three_task/base/models/grocery_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GroceryAddressItem extends StatelessWidget {
  final Addresses address;

  const GroceryAddressItem({Key? key, required this.address}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20).w,
          border: Border.all(color: AppColors.colorGrey4, width: 1)),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15).w,
            child: CachedNetworkImage(
              imageUrl: address.image!,
              width: 50.w,
              height: 50.w,
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(
                value: downloadProgress.progress,
                color: AppColors.colorBlack1,
              ),
              errorWidget: (context, url, error) => const Icon(
                Icons.error,
                color: AppColors.colorRed1,
              ),
            ),
          ),
          SizedBox(width: 8.w,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                address.title!,
                style: TextStyle(
                  color: AppColors.colorGrey1,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5.h,),
              Text(
                address.address!,
                style: TextStyle(
                  color: AppColors.colorGrey1,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

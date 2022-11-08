import 'package:cached_network_image/cached_network_image.dart';
import 'package:eighty_three_task/base/models/grocery_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../base/app_const/colors.dart';

class GroceryCategoryItem extends StatelessWidget {
  final Categories category;

  const GroceryCategoryItem({Key? key, required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15).w,
          child: CachedNetworkImage(
            imageUrl: category.image!,
            width: 60.w,
            height: 60.w,
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
        SizedBox(height: 5.h,),
        Text(
          category.name!,
          style: TextStyle(
            color: AppColors.colorGrey1,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
          ),
        )
      ],),
    );
  }
}

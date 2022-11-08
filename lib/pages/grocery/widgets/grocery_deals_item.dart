import 'package:cached_network_image/cached_network_image.dart';
import 'package:eighty_three_task/base/app_const/assets.dart';
import 'package:eighty_three_task/base/models/grocery_model.dart';
import 'package:eighty_three_task/pages/grocery/grocery_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/app_const/colors.dart';
import '../../../base/controllers/local/local_translations.dart';

class GroceryDealsItem extends StatelessWidget {
  final Deals deal;
  final int index;
  final GroceryController controller;
  const GroceryDealsItem({Key? key, required this.index,required this.deal,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 15.w),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(8).w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15).w,
                  child: CachedNetworkImage(
                    imageUrl: deal.image!,
                    width: 90.w,
                    height: 90.w,
                    fit: BoxFit.fill,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
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
              ),
              Positioned(
                  child: GestureDetector(
                    onTap: ()=> controller.onFavPress(index : index),
                    child: Container(
                width: 30.w,
                height: 30.w,
                decoration: const BoxDecoration(
                      color: AppColors.colorWhite1, shape: BoxShape.circle),
                child: Icon(
                    deal.isFavourite! ? Icons.favorite: Icons.favorite_border,
                    color: deal.isFavourite! ? AppColors.colorRed1 : AppColors.colorGrey5,
                    size: 18.sp,
                ),
              ),
                  ))
            ],
          ),
          SizedBox(
            width: 5.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  deal.name!,
                  style: TextStyle(
                    color: AppColors.colorGrey1,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${deal.quantity!} ${deal.type!}',
                  style: TextStyle(
                    color: AppColors.colorGrey1,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.location2,
                      width: 12.w,
                      height: 12.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      deal.time!,
                      style: TextStyle(
                        color: AppColors.colorGrey1,
                        fontSize: 9.sp,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$ ${deal.discountedPrice!}',
                      style: TextStyle(
                        color: AppColors.colorRed2,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      '\$ ${deal.originalPrice!}',
                      style: TextStyle(
                        color: AppColors.colorGrey1,
                        fontSize: 16.sp,
                        decoration: TextDecoration.lineThrough,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    SizedBox(width: 50.w,),
                    SizedBox(
                      height: 30,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.colorBlack1,
                        ),
                        onPressed: ()=> controller.onAddCartPress(item : deal),
                        child: Text(
                          AppLocalKeys.add.tr,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: AppColors.colorWhite1),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

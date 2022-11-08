import 'package:cached_network_image/cached_network_image.dart';
import 'package:eighty_three_task/base/app_const/const.dart';
import 'package:eighty_three_task/base/models/cart_sql_model.dart';
import 'package:eighty_three_task/pages/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../base/app_const/colors.dart';

class CartListItem extends StatelessWidget {
  final int index;
  final CartSqlModel item;
  final CartController controller;

  const CartListItem(
      {Key? key,
      required this.index,
      required this.controller,
      required this.item})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8).w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15).w,
              child: CachedNetworkImage(
                imageUrl: item.image!,
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
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name!,
                  style: TextStyle(
                    color: AppColors.colorGrey1,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  '${item.quantity!} ${item.type!}',
                  style: TextStyle(
                    color: AppColors.colorGrey1,
                    fontSize: 9.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  '\$ ${item.onePiecePrice!}',
                  style: TextStyle(
                    color: AppColors.colorRed2,
                    fontSize: 18.sp,
                    fontFamily: AppConst.circularStdMediumFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w,),
          GestureDetector(
            onTap: ()=>controller.onRemoveQuantity(index : index),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.colorBlue1,
                  borderRadius: BorderRadius.circular(5).w),
              child: const Icon(
                Icons.remove,
                color: AppColors.colorBlue2,
                size: 35,
              ),
            ),
          ),
          SizedBox(width: 8.w,),
          SizedBox(
            width: 40.w,
            child: Text(
              controller.cartList[index].cartQuantity.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.colorGrey1,
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 8.w,),
          GestureDetector(
            onTap: ()=>controller.onAddQuantity(index : index),
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.colorBlue1,
                  borderRadius: BorderRadius.circular(5).w),
              child: const Icon(
                Icons.add,
                color: AppColors.colorBlue2,
                size: 35,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:eighty_three_task/base/app_const/assets.dart';
import 'package:eighty_three_task/base/app_const/colors.dart';
import 'package:eighty_three_task/base/controllers/public_controllers/public_data_controller.dart';
import 'package:eighty_three_task/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeFab extends StatelessWidget {
  final HomeController controller;
  const HomeFab({Key? key,required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.w,
      height: 70.h,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: AppColors.colorRed3,
          onPressed: controller.onFabButtonPress,
          child: Stack(
            children: [
              Image.asset(
                AppAssets.cartTotal,
                width: 35.w,
                height: 35.h,
              ),
              GetX(
                builder: (PublicDataController publicDataController) {
                  return SizedBox(
                    width: 23.w,
                    height: 23.h,
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          '\$${publicDataController.cartTotal.value.toInt()}',
                          style: TextStyle(fontSize: 9.sp,color: AppColors.colorWhite1),
                        ),
                      ),
                    ),
                  );
                }
              )
            ],
          ),
        ),
      ),
    );
  }
}

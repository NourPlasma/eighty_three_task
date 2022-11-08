import 'package:eighty_three_task/base/app_const/assets.dart';
import 'package:eighty_three_task/base/app_const/colors.dart';
import 'package:eighty_three_task/base/controllers/local/local_translations.dart';
import 'package:eighty_three_task/pages/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeBottomBar extends StatelessWidget {
  const HomeBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeController controller) {
        return SizedBox(
          height: 60.h,
          child: BottomAppBar(
              color: AppColors.colorBlueGrey2,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0).w,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    _buildBarIcon(
                        icon: AppAssets.grocery, key: AppLocalKeys.grocery,controller: controller),
                    const Spacer(
                      flex: 1,
                    ),
                    _buildBarIcon(
                        icon: AppAssets.news, key: AppLocalKeys.news,controller: controller),
                    const Spacer(flex: 3),
                    _buildBarIcon(
                        icon: AppAssets.favourite, key: AppLocalKeys.favorites,controller: controller),
                    const Spacer(
                      flex: 1,
                    ),
                    _buildBarIcon(
                        icon: AppAssets.cart, key: AppLocalKeys.cart,controller: controller),
                  ],
                ),
              )),
        );
      }
    );
  }

  Widget _buildBarIcon({required String icon, required String key,required HomeController controller}) {
    return GestureDetector(
      onTap: ()=> controller.onBottomAppBarIconPress(key: key),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            icon,
            width: 23.w,
            height: 23.h,
            color: controller.activeViewKey == key ? AppColors.colorRed3 : null,
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            key.tr,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 9.sp, color: controller.activeViewKey == key ? AppColors.colorRed3 : AppColors.colorGrey3),
          )
        ],
      ),
    );
  }
}

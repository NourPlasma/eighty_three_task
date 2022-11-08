import 'package:eighty_three_task/base/app_const/assets.dart';
import 'package:eighty_three_task/base/app_const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 35.h, right: 15.w, left: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.w),
            width: 120.w,
            height: 40.h,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppAssets.border),fit: BoxFit.contain),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  AppAssets.location,
                  width: 13.w,
                  height: 16.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Expanded(
                  child: Text('Mustafa St.',
                      style: TextStyle(
                        color: AppColors.colorWhite1,
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.colorBlueGrey1, width: 1)),
            width: 40.w,
            height: 40.h,
          )
        ],
      ),
    );
  }
}

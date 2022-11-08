import 'package:eighty_three_task/base/app_const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../base/controllers/local/local_translations.dart';


class CartText extends StatelessWidget {
   const CartText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        AppLocalKeys.cart.tr,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.colorGrey2,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

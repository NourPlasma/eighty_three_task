import 'package:eighty_three_task/base/app_const/colors.dart';
import 'package:eighty_three_task/pages/home/widgets/home_appbar.dart';
import 'package:eighty_three_task/pages/home/widgets/home_bottom_bar.dart';
import 'package:eighty_three_task/pages/home/widgets/home_fab.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends StatelessWidget {
  final HomeController controller = Get.find();

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorWhite1,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: HomeFab(controller: controller,),
      bottomNavigationBar: const HomeBottomBar(),
      body: Column(
        children: [
          const HomeAppbar(),
          Expanded(child: GetBuilder(
            builder: (HomeController c) {
              return controller.activeView;
            }
          )),
        ],
      ),
    );
  }
}

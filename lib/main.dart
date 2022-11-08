import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'base/app_const/const.dart';
import 'base/bindings.dart';
import 'base/controllers/local/local_translations.dart';
import 'base/controllers/navigation/navigation_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // pref init

  await GetStorage.init();

  //***************************************************************************************************************

  // run app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final GetStorage getStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
          return GetMaterialApp(
            title: 'Eighty Three Task',
            debugShowCheckedModeBanner: false,
            translations: LocalTranslations(),
            locale: Locale(getStorage.read('currentLocale') ?? 'en', ''),
            initialBinding: MainBindings(),
            defaultTransition: Transition.fade,
            getPages: NavigationController.getRouters(),
            fallbackLocale: const Locale('en', ''),
            initialRoute: _getInitRoute(),
            theme: ThemeData(fontFamily: AppConst.helveticaFamily),
          );
      },
    );
  }

  String _getInitRoute() {
    String initRoute = '/home';
    return initRoute;
  }
}

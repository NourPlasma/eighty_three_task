
import 'package:eighty_three_task/pages/home/home_view.dart';
import 'package:get/get.dart';


class NavigationController {
  static List<GetPage<dynamic>> getRouters() {
    return [
      GetPage(name: "/home", page: () => HomeView()),
    ];
  }
}

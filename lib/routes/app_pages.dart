import 'package:get/get.dart';
import 'package:km_test_flutter/first_screen/controllers/first_controller.dart';
import 'package:km_test_flutter/first_screen/view/first_view.dart';
import 'package:km_test_flutter/routes/routes_name.dart';
import 'package:km_test_flutter/second_screen/controllers/second_controller.dart';
import 'package:km_test_flutter/second_screen/view/second_view.dart';
import 'package:km_test_flutter/third_screen/controllers/third_controller.dart';
import 'package:km_test_flutter/third_screen/view/third_view.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesName.firstScreen,
      page: () => const FirstView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => FirstController());
      }),
    ),
    GetPage(
      name: RoutesName.secondScreen,
      page: () => const SecondView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SecondController());
      }),
    ),
    GetPage(
      name: RoutesName.thirdScreen,
      page: () => const ThirdView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ThirdController());
      }),
    ),
  ];
}

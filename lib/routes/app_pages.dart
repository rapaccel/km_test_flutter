import 'package:get/get.dart';
import 'package:km_test_flutter/first_screen/controllers/first_controller.dart';
import 'package:km_test_flutter/first_screen/view/first_view.dart';
import 'package:km_test_flutter/routes/routes_name.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: RoutesName.firstScreen,
      page: () => const FirstView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => FirstController());
      }),
    ),
  ];
}

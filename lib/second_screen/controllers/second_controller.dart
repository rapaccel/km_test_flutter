import 'package:get/get.dart';

class SecondController extends GetxController {
  late String name;
  var selectedName = 'Selected User Name'.obs;
  @override
  void onInit() {
    name = Get.arguments['name'];
    super.onInit();
  }
}

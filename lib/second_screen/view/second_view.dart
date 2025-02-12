import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_test_flutter/assets/custom_button.dart';
import 'package:km_test_flutter/routes/routes_name.dart';
import 'package:km_test_flutter/second_screen/controllers/second_controller.dart';

class SecondView extends GetView<SecondController> {
  const SecondView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Second Screen',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome', style: TextStyle(fontSize: 12)),
            Text(
              controller.name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: Obx(() => Text(
                    controller.selectedName.value,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 24),
                  )),
            ),
            const Spacer(),
            Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                    text: "Choose a User",
                    onPressed: () {
                      Get.toNamed(RoutesName.thirdScreen);
                    }))
          ],
        ),
      ),
    );
  }
}

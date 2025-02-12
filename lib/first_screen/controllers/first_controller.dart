import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_test_flutter/routes/routes_name.dart';

class FirstController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final formKey = GlobalKey<FormState>();
  final formPalindromeKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final palinDromeController = TextEditingController();

  void checkPalindrome() {
    if (formPalindromeKey.currentState!.validate()) {
      String text = palinDromeController.text;
      String reverseText = text.split('').reversed.join();
      if (text == reverseText) {
        Get.dialog(
          AlertDialog(
            title: const Text('Result'),
            content: const Text('isPalindrome'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        Get.dialog(
          AlertDialog(
            title: const Text('Result'),
            content: const Text('not palindrome'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }

  String? nameValidation(String value) {
    if (value.isEmpty) {
      return 'Name cannot be empty';
    }
    return null;
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      Get.toNamed(RoutesName.secondScreen,
          arguments: {'name': nameController.text});
    }
  }

  String? palindromeValidation(String value) {
    if (value.isEmpty) {
      return 'Palindrome is required';
    }
    return null;
  }
}

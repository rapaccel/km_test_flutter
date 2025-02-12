import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirstController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final palinDromeController = TextEditingController();

  void checkPalindrome() {
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

  String? nameValidation(String value) {
    String name = nameController.text;
    if (name.isEmpty) {
      Get.snackbar('Name Validation', 'Name cannot be empty');
    } else {
      return null;
    }
    return null;
  }

  String? palindromeValidation(String value) {
    String text = palinDromeController.text;
    if (text.isEmpty) {
      Get.snackbar('Palindrome Validation', 'Text cannot be empty');
      return 'Text cannot be empty';
    } else {
      Get.snackbar('Palindrome Validation', 'Text is valid');
      return null;
    }
  }
}

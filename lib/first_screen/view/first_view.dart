import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_test_flutter/assets/custom_button.dart';
import 'package:km_test_flutter/assets/custom_text_field.dart';
import 'package:km_test_flutter/first_screen/controllers/first_controller.dart';

class FirstView extends GetView<FirstController> {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 35),
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('lib/assets/images/bg.png'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 116,
                height: 116,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.4)),
                child: const Center(
                    child: Icon(Icons.people, size: 30, color: Colors.white)),
              ),
              const SizedBox(height: 51),
              CustomTextField(
                  controller: controller.nameController,
                  hint: "Name",
                  validator: (value) => controller.nameValidation(value!)),
              const SizedBox(height: 30),
              CustomTextField(
                  controller: controller.palinDromeController,
                  hint: "Palindrome",
                  validator: (value) =>
                      controller.palindromeValidation(value!)),
              const SizedBox(height: 45),
              CustomButton(
                  text: "CHECK", onPressed: () => controller.checkPalindrome()),
              const SizedBox(height: 15),
              CustomButton(text: "NEXT", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_test_flutter/second_screen/controllers/second_controller.dart';
import 'package:km_test_flutter/third_screen/controllers/third_controller.dart';

class ThirdView extends GetView<ThirdController> {
  const ThirdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
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
      body: Obx(() {
        if (controller.isLoading.value && controller.users.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.users.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.person_off, size: 80, color: Colors.grey),
                const SizedBox(height: 10),
                const Text("No users found", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: controller.fetchUsers,
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: controller.refreshUsers,
          child: ListView.builder(
            controller: controller.scrollController,
            itemCount: controller.users.length +
                (controller.isLoadingMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index == controller.users.length) {
                return const Center(
                    child: Padding(
                  padding: EdgeInsets.all(10),
                  child: CircularProgressIndicator(),
                ));
              }

              final user = controller.users[index];
              return ListPage(
                name: user.name,
                email: user.email,
                avatar: user.avatar,
              );
            },
          ),
        );
      }),
    );
  }
}

class ListPage extends StatelessWidget {
  final String name;
  final String email;
  final String avatar;
  const ListPage({
    super.key,
    required this.name,
    required this.email,
    required this.avatar,
  });

  @override
  Widget build(BuildContext context) {
    final SecondController secondController = Get.find<SecondController>();

    return Column(
      children: [
        ListTile(
          title: Text(
            name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          subtitle: Text(email, style: const TextStyle(fontSize: 12)),
          leading: CircleAvatar(
            radius: 49,
            backgroundImage: NetworkImage(avatar),
          ),
          onTap: () {
            secondController.selectedName.value = name;
          },
        ),
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Divider())
      ],
    );
  }
}

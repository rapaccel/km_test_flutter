import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:km_test_flutter/third_screen/users_data.dart';

class ThirdController extends GetxController {
  var users = <UsersData>[].obs;
  var isLoading = true.obs;
  var currentPage = 1;
  var totalPages = 1.obs;
  var isLoadingMore = false.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    fetchUsers();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  Future<void> fetchUsers({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        currentPage = 1;
        users.clear();
      }

      isLoading(true);
      final response = await http.get(Uri.parse(
          "https://reqres.in/api/users?page=$currentPage&per_page=10"));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<UsersData> newUsers = UsersData.fromJsonList(data["data"]);

        if (isRefresh) {
          users.assignAll(newUsers);
        } else {
          users.addAll(newUsers);
        }
      } else {
        Get.snackbar("Error", "Failed to load users");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading(false);
    }
  }

  Future<void> refreshUsers() async {
    await fetchUsers(isRefresh: true);
  }

  void _scrollListener() {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        !isLoadingMore.value) {
      loadMoreUsers();
    }
  }

  Future<void> loadMoreUsers() async {
    if (isLoadingMore.value) return;

    isLoadingMore(true);
    currentPage++;

    try {
      final response = await http.get(Uri.parse(
          "https://reqres.in/api/users?page=$currentPage&per_page=10"));

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<UsersData> newUsers = UsersData.fromJsonList(data["data"]);

        if (newUsers.isNotEmpty) {
          users.addAll(newUsers);
        }
      } else {
        Get.snackbar("Error", "Failed to load more users");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoadingMore(false);
    }
  }

  void onClickUser(UsersData user) {
    Get.snackbar("User", "Clicked on ${user.name}");
  }
}

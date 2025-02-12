import 'package:km_test_flutter/third_screen/users_data.dart';

class UsersResponse {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<UsersData> users;

  UsersResponse({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.users,
  });

  factory UsersResponse.fromJson(Map<String, dynamic> json) {
    return UsersResponse(
      page: json['page'],
      perPage: json['per_page'],
      total: json['total'],
      totalPages: json['total_pages'],
      users: UsersData.fromJsonList(json['data']),
    );
  }
}

class UsersData {
  final int id;
  final String name;
  final String email;
  final String avatar;

  UsersData({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory UsersData.fromJson(Map<String, dynamic> json) {
    return UsersData(
      id: json['id'],
      name:
          "${json['first_name']} ${json['last_name']}", // Gabungkan first dan last name
      email: json['email'],
      avatar: json['avatar'],
    );
  }

  static List<UsersData> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((e) => UsersData.fromJson(e)).toList();
  }
}

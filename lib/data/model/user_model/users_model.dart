class UserModel {
  int id;
  String username;
  String name;
  String state;
  String avatarUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.name,
    required this.state,
    required this.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? 0,
      username: json['username'] ?? "",
      name: json['name'] ?? "",
      state: json['state'] ?? "",
      avatarUrl: json['avatar_url'] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['username'] = username;
    data['name'] = name;
    data['state'] = state;
    data['avatar_url'] = avatarUrl;
    return data;
  }
}

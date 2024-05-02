class UserEntity {
  final String? profileUrl;
  final String? username;
  final String? dispalyName;

  UserEntity({
    this.profileUrl,
    this.username,
    this.dispalyName,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json)
}

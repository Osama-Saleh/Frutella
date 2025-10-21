class UserEntity {
  final String uid;
  final String email;
  final String? name;

  UserEntity({
    required this.uid,
    required this.email,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
    };
  }
}
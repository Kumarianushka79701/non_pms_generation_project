class RegistrationResponse {
  final String message;
  final User user;
  final String token;

  RegistrationResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  // Factory constructor for creating a new `RegistrationResponse` instance from a JSON map
  factory RegistrationResponse.fromJson(Map<String, dynamic> json) {
    return RegistrationResponse(
      message: json['message'],
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}

class User {
  final String username;
  final String email;
  final String mobile;

  User({
    required this.username,
    required this.email,
    required this.mobile,
  });

  // Factory constructor for creating a new `User` instance from a JSON map
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      email: json['email'],
      mobile: json['mobile'],
    );
  }
}


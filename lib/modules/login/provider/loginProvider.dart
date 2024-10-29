import 'dart:convert';

import 'package:flutter/material.dart';

class LoginProvider with ChangeNotifier{

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false; // Track password visibility

}
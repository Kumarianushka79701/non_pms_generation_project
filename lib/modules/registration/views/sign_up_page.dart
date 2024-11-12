import 'package:flutter/material.dart';
import 'package:nonpms_scanner_project/config.dart'; // Import config file
import 'package:nonpms_scanner_project/modules/login/views/login.dart';
import 'package:nonpms_scanner_project/utils/colors.dart';
import 'package:nonpms_scanner_project/widgets/button.dart';
import 'package:nonpms_scanner_project/widgets/common_app_bar.dart';
import 'package:nonpms_scanner_project/widgets/text_widget%20copy.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  // Function to register a user
  Future<void> registerUser(String username, String password, String email) async {
    // Use the base URL from AppConfig
    final url = Uri.parse('${AppConfig.currentBaseUrl}/register');
    
    final body = jsonEncode({
      'username': username,
      'password': password,
      'email': email,
    });
    
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful: ${data['message']}')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration failed: ${response.body}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AColors.lightCyan,
      appBar: 
      getAppBar(context, title: getSignUpAppBarTitle(context), onTap: () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              Align(
                alignment: Alignment.centerLeft,
                child: TextWidget(label: "Register YourSelf !",fontSize: 20,fontWeight: FontWeight.w700,textColor: AColors.black,)),
            SizedBox(height: 20,),
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an email';
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                  .hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(labelText: 'Confirm Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AButton(
                    width: MediaQuery.of(context).size.width * 0.37,
                    label: "Register ",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        registerUser(
                          usernameController.text,
                          passwordController.text,
                          emailController.text,
                        );
                      }
                    },
                  ),
                  AButton(
                    width: MediaQuery.of(context).size.width * 0.37,
                    label: "Login",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getSignUpAppBarTitle(BuildContext context) {
  return const TextWidget(
    label: "Sign Up",
    textColor: AColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
}

import 'package:flutter/material.dart';
import 'package:nonpms_scanner_project/modules/details/views/detailPage.dart';
import 'package:nonpms_scanner_project/modules/login/provider/loginProvider.dart';
import 'package:nonpms_scanner_project/modules/registration/views/sign_up_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:nonpms_scanner_project/utils/colors.dart';
import 'package:nonpms_scanner_project/widgets/button.dart';
import 'package:nonpms_scanner_project/widgets/common_app_bar.dart';
import 'package:nonpms_scanner_project/widgets/text_widget%20copy.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
        final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    return Scaffold(
     appBar: getAppBar(context, title: getLoginAppBarTitle(context), onTap: () {
        Navigator.pop(context);
      }),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: loginProvider.usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller:loginProvider. passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(
                 loginProvider.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      loginProvider.isPasswordVisible = !loginProvider.isPasswordVisible;
                    });
                  },
                ),
              ),
              obscureText: !loginProvider.isPasswordVisible, // Control visibility
            ),
            const SizedBox(height: 20),
            AButton(label: "Login",textAlign: TextAlign.center, width: MediaQuery.of(context)!.size.width*02,
            onTap: (){
              
                if (loginProvider.usernameController.text == 'anushka' &&loginProvider. passwordController.text == '123') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) =>  DetailsPage()), // Navigate to DetailsPage
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid credentials')),
                  );
                }
                          },),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                void onRegisterButtonPressed() {
  registerUser('user1', 'password1', 'user1@example.com', '1234567890');
}
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> registerUser(String username, String password, String email, String mobile) async {
  final url = Uri.parse('http://localhost:3000/register');
  
  final body = jsonEncode({
    'username': username,
    'password': password,
    'email': email,
    'mobile': mobile,
  });
  
  // Send the HTTP POST request
  try {
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      print('Registration successful: ${data['message']}');
      print('Token: ${data['token']}');
    } else {
      print('Registration failed: ${response.body}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
Widget getLoginAppBarTitle(BuildContext context) {
  
    return const TextWidget(
      label: "Login",
      textColor: AColors.white,
      fontSize: 18,
      fontWeight: FontWeight.w700,
    );
  }


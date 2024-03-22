import 'dart:convert';

import 'package:amritha_ayurveda/core/api_end_points.dart';
import 'package:amritha_ayurveda/provider/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SignInService {
  Future<void> login(
      SignInProvider signInProvider, BuildContext context) async {
    print("button clicked");
    // print("username is ${signInProvider.email}");
    // print("password is ${signInProvider.password}");

    Map<String, String> body = {
      'username': signInProvider.emailController.text,
      'password': signInProvider.passwordController.text
    };

    try {
      // Making the POST request
      http.Response response = await http.post(
        Uri.parse("${ApiEndPoints.commonWebUrl}Login"),
        body: body,
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.body);

        if (data['status'] == true) {
          String token = data['token'];
          signInProvider.setToken(token, context);
          print('Logged in successfully. Token: $token');
        } else {
          String message = data['message'];
          print('Login failed: $message');
        }
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}

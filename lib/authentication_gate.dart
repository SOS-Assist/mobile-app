import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/login_or_register.dart';
import 'package:mobile_app/services/authentication.dart';

class AuthenticationGate extends StatelessWidget {
  final AuthenticationService _authenticationService = AuthenticationService();

  AuthenticationGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: _authenticationService.userStream,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginOrRegisterPage();
          }
        }),
      ),
    );
  }
}

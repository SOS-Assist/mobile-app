import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/login_or_register.dart';
import 'package:mobile_app/services/authentication.dart';

class AuthPage extends StatelessWidget {
  final AuthenticationService _authenticationService = AuthenticationService();

  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: _authenticationService.userStream,
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return HomePage(userUid: snapshot.data!.uid);
          } else {
            return const LoginOrRegisterPage();
          }
        }),
      ),
    );
  }
}

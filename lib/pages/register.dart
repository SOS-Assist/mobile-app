import 'package:flutter/material.dart';
import 'package:mobile_app/components/auth_components.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/pages/login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool terms = false;

  void Register() {}

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFF3737),
      body: SafeArea(
        child: Column(
          children: [
            HeadAuth(
              title: "Create an account",
              greeting:
                  "Let’s create a new account and get started with your 30 days free trial.",
            ),
            SizedBox(height: 50),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      AuthTextField(
                        labelText: "Name",
                        controller: usernameController,
                        hintText: "John Doe",
                        obscureText: false,
                      ),
                      AuthTextField(
                        labelText: "Email",
                        controller: emailController,
                        hintText: "main@example.com",
                        obscureText: false,
                      ),
                      AuthTextField(
                        labelText: "Password",
                        controller: passwordController,
                        hintText: "********",
                        obscureText: true,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: terms,
                            onChanged: (value) {
                              setState(() {
                                terms = value!;
                              });
                            },
                          ),
                          Text("I Agree with Terms and Condition"),
                        ],
                      ),
                      LoginButton(
                        // onTap: Register,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        labelAction: "Register",
                      ),
                      GoogleButton(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have an account? "),
                          TextButton(
                            child: Text("Login"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginPage(),
                                  ));
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

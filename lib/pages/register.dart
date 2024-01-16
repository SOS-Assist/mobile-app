import 'package:flutter/material.dart';
import 'package:mobile_app/components/auth_components.dart';
import 'package:mobile_app/services/authentication.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final AuthenticationService _authenticationService = AuthenticationService();
  bool terms = false;

  void Register() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    final user = await _authenticationService.registerWithEmailAndPassword(
      emailController.text,
      passwordController.text,
      usernameController.text,
    );

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login failed')),
      );
    }

    Navigator.pop(context);
  }

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child: Column(
          children: [
            const HeadAuth(
              title: "Create an Account",
              greeting:
                  "Let’s create a new account and get started with your 30 days free trial.",
            ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: SingleChildScrollView(
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
                          const Text("I Agree with Terms and Condition"),
                        ],
                      ),
                      LoginButton(
                        onTap: Register,
                        labelAction: "Register",
                      ),
                      const GoogleButton(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account? "),
                          GestureDetector(
                            onTap: widget.onTap,
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
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

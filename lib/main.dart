import 'package:flutter/material.dart';
import 'package:mobile_app/authentication_gate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color.fromRGBO(255, 55, 55, 1.0);
    const Color backgroundColor = Color.fromRGBO(250, 250, 250, 1.0);
    const Color borderColor = Color.fromRGBO(230, 230, 230, 1.0);
    const Color textColor = Color.fromRGBO(30, 32, 34, 1.0);

    const TextTheme textTheme = TextTheme(
      bodySmall: TextStyle(),
      bodyMedium: TextStyle(),
      bodyLarge: TextStyle(),
      displaySmall: TextStyle(),
      displayMedium: TextStyle(),
      displayLarge: TextStyle(),
      titleSmall: TextStyle(),
      titleMedium: TextStyle(),
      titleLarge: TextStyle(),
      headlineSmall: TextStyle(),
      headlineMedium: TextStyle(),
      headlineLarge: TextStyle(),
    );

    return MaterialApp(
        title: 'SOS Assist',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: primaryColor,
            background: backgroundColor,
            primary: primaryColor,
            outline: borderColor,
          ),
          textTheme: textTheme.apply(
            fontFamily: 'Quicksand',
            bodyColor: textColor,
            displayColor: textColor,
          ),
        ),
        home: AuthenticationGate());
  }
}

import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/edit_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Profile",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 30),
                      Image.asset(
                        'assets/images/profile.png',
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Wahyu",
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Bergabung dari 20 Agustus 2019",
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const EditProfile(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 2,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            backgroundColor: colorScheme.primary),
                        child: Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.white,
                              size: 24.0,
                              semanticLabel:
                                  'Text to announce in accessibility modes',
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'Edit Profile',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
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

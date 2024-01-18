import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/components/auth_components.dart';
import 'package:mobile_app/pages/home.dart';
import 'package:mobile_app/services/user_data.dart';

class EditProfile extends StatefulWidget {
  EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final UserDataServices _userDataServices = UserDataServices();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> updateUserProfile(name, height, weight) async {
    try {
      await _userDataServices.updateUser(name, weight, height);
      return true; // Update successful
    } catch (e) {
      print(e);
      return false; // Update failed
    }
  }

  void handleUserUpdate() async {
    final name = nameController.text;
    final int? height = int.tryParse(userHeightController.text);
    final int? weight = int.tryParse(userWeightController.text);

    final String? userUid = _auth.currentUser?.uid;

    showDialog(
      context:
          context, // Safe to use context here as it's not within an async gap
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    if (name == "" || height == null || weight == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Update Failed')),
      );
      Navigator.pop(context);
      return;
    }

    final updateSuccessful = await updateUserProfile(name, height, weight);

    Navigator.pop(context);

    if (updateSuccessful) {
      final route = MaterialPageRoute(
        builder: (context) =>
            HomePage(userUid: userUid ?? ""), // Handle potential null userUid
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Update Success')),
      );

      WidgetsBinding.instance
          .addPostFrameCallback((_) => Navigator.push(context, route));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Update Failed')),
      );
    }
  }

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final birthController = TextEditingController();
  final phoneController = TextEditingController();
  final userHeightController = TextEditingController();
  final userWeightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Color.fromRGBO(30, 32, 34, 1.0),
                          size: 24.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const Text(
                    "Informasi Data Diri",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    labelText: "Name",
                    controller: nameController,
                    hintText: "Name",
                    obscureText: false,
                  ),
                  AuthTextField(
                    labelText: "Alamat",
                    controller: addressController,
                    hintText: "Alamat",
                    obscureText: false,
                  ),
                  AuthTextField(
                    labelText: "Tanggal Lahir",
                    controller: birthController,
                    hintText: "Tanggal Lahir",
                    obscureText: false,
                  ),
                  AuthTextField(
                    labelText: "Nomor Hp",
                    controller: phoneController,
                    hintText: "Nomor Hp",
                    obscureText: false,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    "Informasi Data Diri",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  AuthTextField(
                    labelText: "Tinggi Badan",
                    controller: userHeightController,
                    hintText: "Tinggi Badan",
                    obscureText: false,
                  ),
                  AuthTextField(
                    labelText: "Berat Badan",
                    controller: userWeightController,
                    hintText: "Berat Badan",
                    obscureText: false,
                  ),
                  LoginButton(
                    onTap: handleUserUpdate,
                    labelAction: "Simpan Data",
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

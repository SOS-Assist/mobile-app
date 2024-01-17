import 'package:flutter/material.dart';
import 'package:mobile_app/components/auth_components.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  void editUserProfile() {}

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    final nameController = TextEditingController();
    final addressController = TextEditingController();
    final birthController = TextEditingController();
    final phoneController = TextEditingController();
    final userHeightController = TextEditingController();
    final userWeightController = TextEditingController();

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
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back,
                          color: Color.fromRGBO(30, 32, 34, 1.0),
                          size: 24.0,
                          semanticLabel:
                              'Text to announce in accessibility modes',
                        ),
                        const SizedBox(width: 10),
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
                  Text(
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
                  Text(
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
                      onTap: editUserProfile, labelAction: "Simpan Data")
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class FormEditProfile extends StatelessWidget {
//   const FormEditProfile({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//     final ColorScheme colorScheme = theme.colorScheme;
//     final double screenWidth = MediaQuery.of(context).size.width;

//     final nameController = TextEditingController();

//     return Column(
//       children: [
//         SizedBox(
//           width: screenWidth,
//           child: Scaffold(
//             body: AuthTextField(
//               labelText: "Name",
//               controller: nameController,
//               hintText: "Name",
//               obscureText: false,
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataServices {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<List<UserModel?>> getAllUser() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('users').get();
      List<UserModel> users = querySnapshot.docs
          .map((doc) => UserModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      if (users.isNotEmpty) {
        return users.toList();
      } else {
        return List.empty();
      }
    } catch (e) {
      print(e);
      return List.empty();
    }
  }

  Future<UserModel?> updateUser(String name, int? weight, int? height) async {
    final User? user = _auth.currentUser;
    final String? userUID = user?.uid;

    try {
      await _firestore
          .doc("/users/$userUID")
          .update({"name": name, "weight": weight, "height": height});
    } catch (e) {
      print(e);
    }
  }
}

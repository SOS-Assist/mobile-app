import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:mobile_app/models/blood_type.dart';

String getFormattedDate(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  String formattedDate = DateFormat.yMMMMd().format(dateTime);
  return formattedDate;
}

int getAge(Timestamp timestamp) {
  DateTime dateTime = timestamp.toDate();
  int birthYear = dateTime.year;
  int currentYear = DateTime.now().year;
  return currentYear - birthYear;
}

class UserModel {
  String? uid;
  final String email;
  final String name;
  final String? birthDate;
  final int? age;
  final int? height;
  final int? weight;
  final BloodType? bloodType;

  UserModel({
    this.uid,
    required this.email,
    required this.name,
    this.birthDate,
    this.age,
    this.height,
    this.weight,
    this.bloodType,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      // 'birth_date': ...,
      'height': height,
      'weight': weight,
      // 'bloodType': ...,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      name: map['name'],
      birthDate: getFormattedDate(map['birth_date']),
      age: getAge(map['birth_date']),
      height: map['height'],
      weight: map['weight'],
      bloodType: BloodType(
        antigen: map['blood_type']['antigen'],
        rhesus: map['blood_type']['rhesus'],
      ),
    );
  }
}

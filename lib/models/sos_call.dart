class SosCallModel {
  String sosType;
  String userUid;

  SosCallModel({
    required this.sosType,
    required this.userUid,
  });

  Map<String, dynamic> toMap() {
    return {
      'sos_type': sosType,
      'user_uid': userUid,
    };
  }

  factory SosCallModel.fromMap(Map<String, dynamic> map) {
    return SosCallModel(
      sosType: map['sos_type'],
      userUid: map['user_uid'],
    );
  }
}

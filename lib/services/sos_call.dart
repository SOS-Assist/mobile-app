import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobile_app/models/sos_call.dart';
import 'package:mobile_app/services/location.dart';

class SosCallService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final LocationService _locationService = LocationService();

  void createSosCall(String sosType, String userUid) async {
    SosCallModel sosCall = SosCallModel(sosType: sosType, userUid: userUid);

    DocumentReference documentReference =
        await _firestore.collection('sos_calls').add(sosCall.toMap());

    _locationService.listenUserLocation(documentReference.id, sos: true);
  }

  void dispose() {
    _locationService.dispose();
  }
}

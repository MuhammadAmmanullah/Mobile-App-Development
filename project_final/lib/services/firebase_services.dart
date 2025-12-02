import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class FirebaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveCustomization(String uid, Map<String, dynamic> data) async {
    await _firestore.collection('customizations').doc(uid).set(data);
  }

  Future<Map<String, dynamic>?> getCustomization(String uid) async {
    DocumentSnapshot snapshot = await _firestore
        .collection('customizations')
        .doc(uid)
        .get();
    if (snapshot.exists) {
      return snapshot.data() as Map<String, dynamic>;
    }
    return null;
  }
}

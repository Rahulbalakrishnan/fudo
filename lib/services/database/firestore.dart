import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // GET COLLECTIONS OF ORDER
  final CollectionReference orders =
      FirebaseFirestore.instance.collection('orders');

  // SAVE ORDER TO DATABASE
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,
    });
  }
}

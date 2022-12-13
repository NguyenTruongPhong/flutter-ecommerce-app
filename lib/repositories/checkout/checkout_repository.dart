import 'package:cloud_firestore/cloud_firestore.dart';

import './base_checkout_repository.dart';

import '../../models/models.dart';

class CheckoutRepository extends BaseCheckoutRepository {
  CheckoutRepository({
    FirebaseFirestore? firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firebaseFirestore;

  @override
  Future<void> addCheckout(Checkout checkout) async {
    await _firebaseFirestore.collection('checkout').add(checkout.toDocument());
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

import 'base_product_repository.dart';

class ProductRepository extends BaseProductRepository {
  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firebaseFirestore;

  @override
  Stream<List<Product>> getAllProducts() {
    return _firebaseFirestore
        .collection('products')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => Product.fromSnapshot(doc))
          .toList();
    });
  }
}

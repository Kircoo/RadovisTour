import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreCategories {
  getFireStoreCategories({
    var categories,
  }) {
    return FirebaseFirestore.instance.collectionGroup(categories).get();
  }

  getFireStoreSubCategories({var subCategories}) {
    return FirebaseFirestore.instance.collectionGroup(subCategories).get();
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:radovis_tour/models/fb_sub_model.dart';

class FirebaseProvider with ChangeNotifier {
  List<QueryDocumentSnapshot> subCats = [];
  late var currentCategory;
  FbItem currentItem = FbItem();
  Set<Marker> mark = {};

  // GET THE CURRENT SELECTED ITEM ALL THE DETAILS
  Future<FbItem>? getCurrentItem({
    var name,
    var description,
    var lon,
    var lat,
    var id,
    var imageUrl,
  }) {
    final FbItem theItem = FbItem(
      name: name,
      description: description,
      lon: lon,
      lat: lat,
      id: id,
      imageUrl: imageUrl,
    );

    currentItem = theItem;

    notifyListeners();

    return null;
  }

  // GET THE MAIN CATEGORIES FROM FIREBASE
  Future<QuerySnapshot<Object?>>? getFireStoreCategories({
    required var categories,
  }) {
    return FirebaseFirestore.instance
        .collection(categories)
        .orderBy('catId', descending: false)
        .get();
  }

  // GET THE CURRENT SUBCATEGORIES FROM SELECTED CATEGORY
  Future<void> getCurrentFireStreCategoryData({
    required var categories,
    var index,
  }) {
    final items = FirebaseFirestore.instance
        .collection(categories)
        .orderBy('catId', descending: false)
        .get();
    items.then((value) {
      currentCategory = value.docs[index].data();
    });
    notifyListeners();
    return items;
  }

  // GET THE SUBCATEGORIES FROM FIREBASE
  Future<void> getFireStoreSubCategories({
    required var subCategories,
  }) {
    final items =
        FirebaseFirestore.instance.collectionGroup(subCategories).get();
    items.then((value) {
      subCats = value.docs;
    });
    notifyListeners();

    return FirebaseFirestore.instance.collectionGroup(subCategories).get();
  }

  // GET THE MARKERS FROM FIREBASE
  Future<void> getMarkers() {
    final items = FirebaseFirestore.instance.collection('markers').get();
    items.then(
      (value) {
        value.docs.forEach(
          (element) {
            mark.add(
              Marker(
                markerId: MarkerId(
                  element.id.toString(),
                ),
                position: LatLng(element.data()['lon'], element.data()['lat']),
                infoWindow: InfoWindow(
                  title: element.data()['name'],
                ),
              ),
            );
          },
        );
      },
    );
    return FirebaseFirestore.instance.collection('markers').get();
  }
}

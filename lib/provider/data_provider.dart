import 'package:flutter/material.dart';
import 'package:radovis_tour/data/favorites_list.dart';
import 'package:radovis_tour/data/visited_list.dart';
import 'package:radovis_tour/helpers/db_helper.dart';
import 'package:radovis_tour/models/favorites_model.dart';
import 'package:radovis_tour/models/visited_model.dart';

class DataProvider with ChangeNotifier {
  bool check = true;

  Future<void> fetchFavorites() async {
    final dataList = await DBS.getDB('favorites');

    favoritesList = dataList
        .map(
          (e) => Favorites(
            id: e['id'],
            name: e['name'],
          ),
        )
        .toList();
    notifyListeners();
  }

  Future<void> fetchVisited() async {
    final dataList = await DBS.getDB('visited');

    visitedList = dataList
        .map(
          (e) => Visited(
            id: e['id'],
            name: e['name'],
          ),
        )
        .toList();
    notifyListeners();
  }
}

import 'package:flutter/material.dart';

class Visited {
  String? id;
  String? name;
  String? imageUrl;
  String? description;
  dynamic lon;
  dynamic lat;

  Visited({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.lat,
    required this.lon,
  });
}

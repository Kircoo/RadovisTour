import 'package:flutter/material.dart';
import 'package:radovis_tour/widgets/subitems/subitem_details.dart';

class SubItemBody extends StatefulWidget {
  final String id;
  final String name;
  final String desc;
  final dynamic lon;
  final dynamic lat;
  final String imageUrl;

  SubItemBody({
    @required this.id,
    @required this.name,
    @required this.desc,
    @required this.lon,
    @required this.lat,
    @required this.imageUrl,
  });
  @override
  _SubItemBodyState createState() => _SubItemBodyState();
}

class _SubItemBodyState extends State<SubItemBody> {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      fillOverscroll: true,
      hasScrollBody: false,
      child: Container(
        child: SubItemDetails(
          id: widget.id,
          name: widget.name,
          desc: widget.desc,
          lon: widget.lon,
          lat: widget.lat,
          imageUrl: widget.imageUrl,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SubItemBar extends StatefulWidget {
  final dynamic id;
  final String? name;
  final String? imageUrl;

  SubItemBar({
    required this.id,
    required this.name,
    required this.imageUrl,
  });
  @override
  _SubItemBarState createState() => _SubItemBarState();
}

class _SubItemBarState extends State<SubItemBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      pinned: true,
      flexibleSpace: Stack(
        children: [
          Hero(
            tag: widget.id,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    widget.imageUrl!,
                  ),
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3),
                    BlendMode.darken,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                widget.name!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ],
      ),
      expandedHeight: 450,
    );
  }
}

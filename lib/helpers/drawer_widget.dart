import 'package:flutter/material.dart';
import 'package:radovis_tour/widgets/about/about_screen.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  Widget _cardBuilder(String name, Function function, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: GestureDetector(
        onTap: function,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: ListTile(
            title: Text(name),
            trailing: Icon(
              iconData,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.25,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset('assets/images/radovislogo.png'),
                  height: 110,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                  ),
                  child: Text(
                    'Temterature',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _cardBuilder(
                      'About',
                      () {
                        Navigator.of(context).pushNamed(AboutScreen.routeName);
                      },
                      Icons.location_city,
                    ),
                    _cardBuilder(
                      'Favorite',
                      () {},
                      Icons.favorite,
                    ),
                    _cardBuilder(
                      'Visited',
                      () {},
                      Icons.remove_red_eye,
                    ),
                    _cardBuilder(
                      'Weather',
                      () {},
                      Icons.cloud,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

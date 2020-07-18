import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radovis_tour/data/visited_list.dart';
import 'package:radovis_tour/helpers/db_helper.dart';
import 'package:radovis_tour/provider/data_provider.dart';
import 'package:radovis_tour/widgets/subitems/subitem_screen.dart';

class VisitedScreen extends StatefulWidget {
  static const routeName = '/visited';

  @override
  _VisitedScreenState createState() => _VisitedScreenState();
}

class _VisitedScreenState extends State<VisitedScreen> {
  final GlobalKey<AnimatedListState> _keyVisited = GlobalKey();
  var _isInit = true;
  var _isLoading = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<DataProvider>(context).fetchVisited().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Visited'),
        ),
        body: Container(
          child: _isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : FutureBuilder(
                  future: Provider.of<DataProvider>(context, listen: false)
                      .fetchVisited(),
                  builder: (ctx, snapshot) => visitedList.isEmpty
                      ? Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Your visited list is empty!'),
                              Icon(Icons.sentiment_dissatisfied),
                            ],
                          ),
                        )
                      : AnimatedList(
                          key: _keyVisited,
                          itemBuilder: (ctx, index, animation) => _buildItem(
                              visitedList[index].name, index, animation),
                          initialItemCount: visitedList.length,
                        ),
                ),
        ),
      ),
    );
  }

  Widget _buildItem(
    String item,
    int index,
    Animation animation,
  ) {
    return ScaleTransition(
      scale: animation,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(SubItemScreen.routeName,
                arguments: visitedList[index].id);
          },
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
              title: Text(
                item,
              ),
              trailing: Builder(
                builder: (context) => IconButton(
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    _removeItem(index);
                    setState(() {
                      DBS.delete(
                        'visited',
                        visitedList[index].id,
                        '${visitedList[index].name}',
                        'Visited',
                        context,
                      );
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _removeItem(int i) {
    String removeItem = visitedList[i].name;
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return _buildItem(removeItem, i, animation);
    };
    _keyVisited.currentState.removeItem(i, builder);
  }
}

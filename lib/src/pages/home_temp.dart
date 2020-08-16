import 'package:flutter/material.dart';

// Demo
class HomePageTemp extends StatelessWidget {
  //  const HomePageTemp({Key key}) : super(key: key);
  final options = ['One', 'Two', 'Three', 'Four', 'Five'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Components Temp'),
      ),
      body: ListView(
          // children: _createList()
          children: _createShortList()),
    );
  }

  List<Widget> _createList() {
    List<Widget> list = new List<Widget>();
    for (String opt in options) {
      final tempWidget = ListTile(
        title: Text(opt),
      );
      list..add(tempWidget)..add(Divider());
    }
    return list;
  }

  List<Widget> _createShortList() {
    return options
        .map((String e) => Column(
              children: [
                ListTile(
                  title: Text(e),
                  subtitle: Text('Sublist from $e'),
                  leading: Icon(Icons.account_box),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {},
                ),
                Divider()
              ],
            ))
        .toList();
  }
}

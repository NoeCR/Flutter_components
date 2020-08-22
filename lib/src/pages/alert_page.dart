import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  static final pageName = 'alert';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _showAlert(context);
          },
          child: Text('Show alert'),
          color: Colors.blue,
          textColor: Colors.white,
          shape: StadiumBorder(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_location),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }

  void _showAlert(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(
                style: BorderStyle.solid, width: 5.0, color: Colors.blue[50])),
        title: Text('Title'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('This is the content of box alert!'),
            FlutterLogo(
              size: 100.0,
            )
          ],
        ),
        actions: <Widget>[
          FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel')),
          FlatButton(
              onPressed: () => Navigator.of(context).pop(), child: Text('Ok'))
        ],
      ),
    );
  }
}

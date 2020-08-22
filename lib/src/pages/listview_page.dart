import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  static final pageName = 'list';
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _numberList = new List();
  int _lastNumber = 0;
  bool _isLoading = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _addTen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lists'),
        ),
        body: Stack(
          children: <Widget>[
            _createLoading(),
            _createList(),
          ],
        ));
  }

  Widget _createList() {
    return RefreshIndicator(
      onRefresh: _getFirstPage,
      child: ListView.builder(
          controller: _scrollController,
          itemCount: _numberList.length,
          itemBuilder: (BuildContext context, index) {
            final img = _numberList[index];
            return FadeInImage(
                placeholder: AssetImage('assets/image/jar-loading.gif'),
                image:
                    NetworkImage('https://picsum.photos/500/300/?image=$img'));
          }),
    );
  }

  Future<Null> _getFirstPage() async {
    final duration = new Duration(seconds: 2);

    new Timer(duration, () {
      _numberList.clear();
      _lastNumber++;
      _addTen();
    });

    return Future.delayed(duration);
  }

  _addTen() {
    for (var i = 0; i < 10; i++) {
      _lastNumber++;
      _numberList.add(_lastNumber);
    }
    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(duration, respHTTP);

    return null;
  }

  void respHTTP() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _addTen();
  }

  Widget _createLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }
}

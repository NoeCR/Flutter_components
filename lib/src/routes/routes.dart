import 'package:flutter/material.dart';
import 'package:flutter_components_01/src/pages/alert_page.dart';
import 'package:flutter_components_01/src/pages/avatar_page.dart';
import 'package:flutter_components_01/src/pages/card_page.dart';
import 'package:flutter_components_01/src/pages/home_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    'avatar': (BuildContext context) => AvatarPage(),
    'card': (BuildContext context) => CardPage(),
  };
}

import 'package:flutter/material.dart';
import 'package:flutter_components_01/src/pages/alert_page.dart';
import 'package:flutter_components_01/src/pages/animated_container.dart';
import 'package:flutter_components_01/src/pages/avatar_page.dart';
import 'package:flutter_components_01/src/pages/card_page.dart';
import 'package:flutter_components_01/src/pages/home_page.dart';
import 'package:flutter_components_01/src/pages/input_page.dart';
import 'package:flutter_components_01/src/pages/listview_page.dart';
import 'package:flutter_components_01/src/pages/sliders_page.dart';

Map<String, WidgetBuilder> getAppRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    AlertPage.pageName: (BuildContext context) => AlertPage(),
    AvatarPage.pageName: (BuildContext context) => AvatarPage(),
    CardPage.pageName: (BuildContext context) => CardPage(),
    AnimatedContainerPage.pageName: (BuildContext context) =>
        AnimatedContainerPage(),
    InputPage.pageName: (BuildContext context) => InputPage(),
    SliderPage.pageName: (BuildContext context) => SliderPage(),
    ListPage.pageName: (BuildContext context) => ListPage(),
  };
}

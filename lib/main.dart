import 'package:flutter/material.dart';
import 'package:submission2/ui/detail/detail.dart';
import 'package:submission2/ui/home/home.dart';
import 'package:submission2/ui/home/home_support/search.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (context) => HomePage(),
        SearchPage.routeName: (context) => SearchPage(),
        DetailPage.routeName: (context) => DetailPage(
              id: ModalRoute.of(context).settings.arguments,
            ),
      },
    );
  }
}
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/restaurant_page.dart';
import 'pages/ideas_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Ristoranti',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/restaurants': (context) => RestaurantPage(),
        '/ideas': (context) => IdeasPage(),
      },
    );
  }
}

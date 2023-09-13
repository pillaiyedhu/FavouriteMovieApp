import 'package:day9_provider_favlistapp/providers/MovieProvider.dart';
import 'package:day9_provider_favlistapp/screens/Page1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MovieProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider-FavListApp',
      theme: ThemeData(brightness: Brightness.dark),
      home:Page1(),
    );
  }
}

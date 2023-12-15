import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'App/Views/HomeScreen/Views/homescreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    routes: {
      '/': (ctx) => HomeScreen(),
    },
  ));
}

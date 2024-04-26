import 'package:flutter/material.dart';
import 'package:quranapp/pages/home_pages.dart';
import 'package:quranapp/pages/sura_pages.dart';
import 'package:quranapp/widget/bottom_bar_widget.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomBarWidget(),
      debugShowCheckedModeBanner: false,
    );
  }
}

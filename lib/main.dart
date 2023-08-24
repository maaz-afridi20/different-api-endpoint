import 'package:flutter/material.dart';

import 'guruapi/guru_api_main.dart';
import 'makeup/makeup_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MakeUpMain(),
    );
  }
}

import 'package:bit_coin_rates/bored_api/bored_api_main.dart';
import 'package:bit_coin_rates/mybitcoin/mybitcoin_main.dart';
import 'package:bit_coin_rates/populationapi/population_api_main.dart';
import 'package:flutter/material.dart';

import 'guruapi/guru_api_main.dart';

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
      home: MyBitcoinMain(),
    );
  }
}

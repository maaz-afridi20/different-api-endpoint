import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// ignore: must_be_immutable
class MakeUpMain extends StatefulWidget {
  MakeUpMain({super.key});

  @override
  State<MakeUpMain> createState() => _MakeUpMainState();
}

class _MakeUpMainState extends State<MakeUpMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makeup'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

import 'dart:convert';

import 'package:bit_coin_rates/guruapi/guru_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GuruApiMain extends StatefulWidget {
  const GuruApiMain({super.key});

  @override
  State<GuruApiMain> createState() => _GuruApiMainState();
}

class _GuruApiMainState extends State<GuruApiMain> {
  Future<GuruApiModel> fetchData() async {
    GuruApiModel gruu;
    var response =
        await http.get(Uri.parse('https://api.apis.guru/v2/list.json'));
    if (response.statusCode == 200) {
      var jsonDecoded = json.decode(response.body);
      return GuruApiModel.fromJson(jsonDecoded);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return Scaffold(
      appBar: AppBar(
        title: const Text('postssss'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<GuruApiModel> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: Text('getting nodata'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return Center(
              child: Text('some data'),
            );
          } else {
            return Center(
              child: Text('no data'),
            );
          }
        },
      ),
    );
  }
}

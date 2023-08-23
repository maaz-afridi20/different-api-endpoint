import 'dart:convert';

import 'package:bit_coin_rates/bored_api/bored_api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BoredApiMain extends StatefulWidget {
  BoredApiMain({super.key});

  @override
  State<BoredApiMain> createState() => _BoredApiMainState();
}

class _BoredApiMainState extends State<BoredApiMain> {
  Future<BoredApiModel> fetchData() async {
    BoredApiModel bam;

    http.Response response =
        await http.get(Uri.parse('https://www.boredapi.com/api/activity'));

    var jsonDecoded = await json.decode(response.body);

    bam = BoredApiModel.fromJson(jsonDecoded);
    print(response.body);

    return bam;
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
        title: const Text('Bored Api'),
      ),
      body: FutureBuilder<BoredApiModel>(
        future: fetchData(),
        builder: (BuildContext context, AsyncSnapshot<BoredApiModel> snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text('internet waiting'));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                child: Text(snapshot.data!.activity),
              ),
              Card(
                child: Text(snapshot.data!.type),
              ),
              Card(
                child: Text(snapshot.data!.accessibility.toString()),
              ),
              Card(
                child: Text(snapshot.data!.activity.toString()),
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'dart:convert';

import 'package:bit_coin_rates/makeup/makeup_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class MakeUpMain extends StatelessWidget {
  MakeUpMain({super.key});

  List<MakeupModel> makeupData = [];

  Future<List<MakeupModel>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://makeup-api.herokuapp.com/api/v1/products.json?brand=maybelline'));
    var jsonDecoded = json.decode(response.body.toString());

    if (response.statusCode == 200) {
      for (var item in jsonDecoded) {
        makeupData.add(MakeupModel.fromJson(item));
      }

      return makeupData;
    } else {
      return makeupData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Makeup'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<MakeupModel>> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: AlertDialog(
                content: SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(height: 8),
                      Text("internet Loading..."),
                    ],
                  ),
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: makeupData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 10.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(snapshot.data![index].name),
                    const SizedBox(height: 15),
                    Text(snapshot.data![index].brand.toString()),
                    Text(snapshot.data![index].description.toString()),
                    Text('${snapshot.data![index].price}\$'),
                    const SizedBox(height: 20),
                    InkWell(
                        onTap: () async {
                          if (await canLaunchUrl(
                            Uri.parse(snapshot.data![index].productLink),
                          )) {
                            await launchUrl(
                              Uri.parse(snapshot.data![index].productLink),
                            );
                          }
                        },
                        child: Text(snapshot.data![index].productLink)),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}

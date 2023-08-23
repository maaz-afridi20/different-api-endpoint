import 'dart:convert';

import 'package:bit_coin_rates/populationapi/population_api_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopulationApiMain extends StatefulWidget {
  const PopulationApiMain({super.key});

  @override
  State<PopulationApiMain> createState() => _PopulationApiMainState();
}

class _PopulationApiMainState extends State<PopulationApiMain> {
  Future<PopulationApiModel> fetchData() async {
    PopulationApiModel pam;
    final response = await http.get(Uri.parse(
        'https://datausa.io/api/data?drilldowns=Nation&measures=Population'));

    var decodedData = json.decode(response.body);

    pam = PopulationApiModel.fromJson(decodedData);

    print(response.body);

    return pam;
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
        title: const Text('populatino'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context,
              AsyncSnapshot<PopulationApiModel> snapshot) {
            if (!snapshot.hasData) {
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AlertDialog(
                      content: Container(
                        height: 100,
                        width: 200,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Loading internet Data'),
                            CircularProgressIndicator(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    snapshot.data!.data.length,
                    (index) => Card(
                      child: ListTile(
                        tileColor: Colors.orange,
                        title: Column(
                          children: [
                            Text(
                              'Nation id ${snapshot.data!.data[index].idNation}',
                            ),
                            Text(
                              ' Nation Name ${snapshot.data!.data[index].nation}',
                            ),
                            Text(
                              ' Nation Population ${snapshot.data!.data[index].population}',
                            ),
                            Text(
                              'Slug Nation ${snapshot.data!.data[index].slugNation}',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ListTile(
                    tileColor: Colors.green,
                    title: Text(
                      snapshot.data!.source[0].annotations.sourceDescription,
                    ),
                  ),
                  ListTile(
                    tileColor: Colors.amberAccent,
                    title: Text(
                        'id of nation : ${snapshot.data!.data[0].idNation}'),
                  ),
                  ListTile(
                    tileColor: Colors.amber,
                    title:
                        Text('nation name : ${snapshot.data!.data[0].nation}'),
                  ),
                  ListTile(
                    tileColor: Colors.grey,
                    title: Text('Year : ${snapshot.data!.data[0].year}'),
                  ),
                  ListTile(
                    tileColor: Colors.yellow,
                    title: Text(
                        'Population : ${snapshot.data!.data[0].population}'),
                  ),
                  const SizedBox(height: 50),
                  ...List.generate(
                    snapshot.data!.source.length,
                    (index) => ListTile(
                      tileColor: Colors.green,
                      title: Text(
                        snapshot.data!.source[index].annotations.sourceName,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

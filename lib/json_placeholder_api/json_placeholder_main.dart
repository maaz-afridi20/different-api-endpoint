import 'dart:convert';
import 'package:bit_coin_rates/json_placeholder_api/json_placeholder_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class JsonPlaceholderMain extends StatefulWidget {
  const JsonPlaceholderMain({super.key});

  @override
  State<JsonPlaceholderMain> createState() => _JsonPlaceholderMainState();
}

class _JsonPlaceholderMainState extends State<JsonPlaceholderMain> {
  List<JsonPlaceholderModel> listData = [];
  Future<List<JsonPlaceholderModel>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    var data = json.decode(response.body.toString());

    if (response.statusCode == 200) {
      for (var i in data) {
        listData.add(JsonPlaceholderModel.fromJson(i));
        print(i['name']);
      }

      return listData;
    } else {
      return listData;
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Json place holder api main'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder: (BuildContext context,
            AsyncSnapshot<List<JsonPlaceholderModel>> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: listData.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                elevation: 5.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Id : ${snapshot.data![index].id}'),
                    const SizedBox(height: 20),
                    Text('Name :${snapshot.data![index].name} '),
                    const SizedBox(height: 20),
                    Text('UserName :${snapshot.data![index].username} '),
                    const SizedBox(height: 20),
                    Text('Address :${snapshot.data![index].address.city} '),
                    const SizedBox(height: 20),
                    Text(
                        'Location : \n${snapshot.data![index].address.geo.lat}\n${snapshot.data![index].address.geo.lng}'),
                    const SizedBox(height: 20),
                    Text('Company :${snapshot.data![index].company.name} '),
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

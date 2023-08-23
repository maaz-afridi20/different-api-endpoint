import 'dart:convert';

import 'package:bit_coin_rates/bitcoin/bitcoin_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BitCoinRates extends StatefulWidget {
  BitCoinRates({super.key});

  @override
  State<BitCoinRates> createState() => _BitCoinRatesState();
}

class _BitCoinRatesState extends State<BitCoinRates> {
  Map? data;

  Future<BitcoinModel> fetchData() async {
    BitcoinModel bm;
    String url = 'https://api.coindesk.com/v1/bpi/currentprice.json';
    http.Response response = await http.get(Uri.parse(url));

    var jsonResponce = json.decode(response.body);

    bm = BitcoinModel.fromJson(jsonResponce);

    return bm;
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
      body: SafeArea(
        child: FutureBuilder<BitcoinModel>(
          future: fetchData(),
          builder:
              (BuildContext context, AsyncSnapshot<BitcoinModel> snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text('network loading'),
              );
            }

            return Column(
              children: [
                const Text('Time'),
                myCards(snapshot, snapshot.data!.time.updated),
                const SizedBox(height: 10),
                const Text('Disclaimer'),
                myCards(snapshot, snapshot.data!.disclaimer),
                const SizedBox(height: 10),
                const Text('Chart Name'),
                myCards(snapshot, snapshot.data!.chartName),
                const SizedBox(height: 10),
                const Text('Coin'),
                myCards(snapshot, snapshot.data!.bpi.usd.rate),
              ],
            );
          },
        ),
      ),
    );
  }

  SizedBox myCards(AsyncSnapshot<BitcoinModel> snapshot, String text) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text),
          ),
        ),
      ),
    );
  }
}

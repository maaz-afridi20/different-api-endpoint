import 'dart:convert';

import 'package:bit_coin_rates/mybitcoin/mybitcoin_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MyBitcoinMain extends StatelessWidget {
  MyBitcoinMain({super.key});

  Future<MyBitcoinModel> fetchData() async {
    MyBitcoinModel mbm;
    final response = await http
        .get(Uri.parse('https://api.coinpaprika.com/v1/coins/btc-bitcoin'));
    var jsonData = json.decode(response.body);

    mbm = MyBitcoinModel.fromJson(jsonData);
    return mbm;
  }

  YoutubePlayerController myYoutubePlayerController = YoutubePlayerController(
    initialVideoId: 'hP25aVmxkP8',
    flags: const YoutubePlayerFlags(
      showLiveFullscreenButton: true,
      autoPlay: true,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyBitcoin'),
      ),
      body: FutureBuilder(
        future: fetchData(),
        builder:
            (BuildContext context, AsyncSnapshot<MyBitcoinModel> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AlertDialog(
                    content: SizedBox(
                      height: 100,
                      width: 200,
                      child: Column(
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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(snapshot.data!.id),
                  Text(snapshot.data!.name),
                  Text(snapshot.data!.symbol),
                  Text(snapshot.data!.isActive.toString()),
                  Text(snapshot.data!.isNew.toString()),
                  const SizedBox(height: 30),
                  Text(snapshot.data!.tags[1].id),
                  Text(snapshot.data!.tags[1].coinCounter.toString()),
                  Text(snapshot.data!.tags[1].icoCounter.toString()),
                  InkWell(
                      onTap: () async {
                        final url = Uri.parse(snapshot.data!.logo);

                        if (await canLaunchUrl(url)) {
                          await launchUrl(url);
                          print('google');
                        }
                      },
                      child: Text(snapshot.data!.logo)),
                  Text(snapshot.data!.team[1].id.toString()),
                  Text(snapshot.data!.team[1].position.toString()),
                  const SizedBox(height: 40),
                  const Text('listty data'),
                  const SizedBox(height: 40),
                  ...List.generate(
                    snapshot.data!.team.length,
                    (index) => Column(
                      children: [
                        Text(snapshot.data!.team[index].id.toString()),
                        Text(snapshot.data!.team[index].name.toString()),
                        Text(snapshot.data!.team[index].position.toString()),
                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(snapshot.data!.description),
                  Text(snapshot.data!.startedAt.toString()),
                  const SizedBox(height: 20),
                  Text(snapshot.data!.links.explorer[1]),
                  const SizedBox(height: 10),
                  const Text('Some Url'),
                  const SizedBox(height: 10),
                  ...List.generate(
                    snapshot.data!.links.explorer.length,
                    (index) => Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            var myUrl =
                                Uri.parse(snapshot.data!.links.explorer[index]);

                            if (await canLaunchUrl(myUrl)) {
                              await launchUrl(myUrl);
                            }
                          },
                          child: Text(
                            snapshot.data!.links.explorer[index],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  ListTile(
                    tileColor: Colors.green,
                    title: InkWell(
                        onTap: () async {
                          var myyoutube = Uri.parse(
                              snapshot.data!.links.youtube.toString());
                          if (await canLaunchUrl(myyoutube)) {
                            await launchUrl(myyoutube);
                          }
                        },
                        child: Text(snapshot.data!.links.youtube.toString())),
                  ),
                  Container(
                    child: YoutubePlayer(
                        showVideoProgressIndicator: true,
                        controller: myYoutubePlayerController),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

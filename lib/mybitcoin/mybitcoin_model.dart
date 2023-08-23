// To parse this JSON data, do
//
//     final myBitcoinModel = myBitcoinModelFromJson(jsonString);

import 'dart:convert';

MyBitcoinModel myBitcoinModelFromJson(String str) =>
    MyBitcoinModel.fromJson(json.decode(str));

String myBitcoinModelToJson(MyBitcoinModel data) => json.encode(data.toJson());

class MyBitcoinModel {
  String id;
  String name;
  String symbol;
  int rank;
  bool isNew;
  bool isActive;
  String type;
  String logo;
  List<Tag> tags;
  List<Team> team;
  String description;
  String message;
  bool openSource;
  DateTime startedAt;
  String developmentStatus;
  bool hardwareWallet;
  String proofType;
  String orgStructure;
  String hashAlgorithm;
  Links links;
  List<LinksExtended> linksExtended;
  Whitepaper whitepaper;
  DateTime firstDataAt;
  DateTime lastDataAt;

  MyBitcoinModel({
    required this.id,
    required this.name,
    required this.symbol,
    required this.rank,
    required this.isNew,
    required this.isActive,
    required this.type,
    required this.logo,
    required this.tags,
    required this.team,
    required this.description,
    required this.message,
    required this.openSource,
    required this.startedAt,
    required this.developmentStatus,
    required this.hardwareWallet,
    required this.proofType,
    required this.orgStructure,
    required this.hashAlgorithm,
    required this.links,
    required this.linksExtended,
    required this.whitepaper,
    required this.firstDataAt,
    required this.lastDataAt,
  });

  factory MyBitcoinModel.fromJson(Map<String, dynamic> json) => MyBitcoinModel(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        rank: json["rank"],
        isNew: json["is_new"],
        isActive: json["is_active"],
        type: json["type"],
        logo: json["logo"],
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
        team: List<Team>.from(json["team"].map((x) => Team.fromJson(x))),
        description: json["description"],
        message: json["message"],
        openSource: json["open_source"],
        startedAt: DateTime.parse(json["started_at"]),
        developmentStatus: json["development_status"],
        hardwareWallet: json["hardware_wallet"],
        proofType: json["proof_type"],
        orgStructure: json["org_structure"],
        hashAlgorithm: json["hash_algorithm"],
        links: Links.fromJson(json["links"]),
        linksExtended: List<LinksExtended>.from(
            json["links_extended"].map((x) => LinksExtended.fromJson(x))),
        whitepaper: Whitepaper.fromJson(json["whitepaper"]),
        firstDataAt: DateTime.parse(json["first_data_at"]),
        lastDataAt: DateTime.parse(json["last_data_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "rank": rank,
        "is_new": isNew,
        "is_active": isActive,
        "type": type,
        "logo": logo,
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
        "team": List<dynamic>.from(team.map((x) => x.toJson())),
        "description": description,
        "message": message,
        "open_source": openSource,
        "started_at": startedAt.toIso8601String(),
        "development_status": developmentStatus,
        "hardware_wallet": hardwareWallet,
        "proof_type": proofType,
        "org_structure": orgStructure,
        "hash_algorithm": hashAlgorithm,
        "links": links.toJson(),
        "links_extended":
            List<dynamic>.from(linksExtended.map((x) => x.toJson())),
        "whitepaper": whitepaper.toJson(),
        "first_data_at": firstDataAt.toIso8601String(),
        "last_data_at": lastDataAt.toIso8601String(),
      };
}

class Links {
  List<String> explorer;
  List<String> facebook;
  List<String> reddit;
  List<String> sourceCode;
  List<String> website;
  List<String> youtube;

  Links({
    required this.explorer,
    required this.facebook,
    required this.reddit,
    required this.sourceCode,
    required this.website,
    required this.youtube,
  });

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        explorer: List<String>.from(json["explorer"].map((x) => x)),
        facebook: List<String>.from(json["facebook"].map((x) => x)),
        reddit: List<String>.from(json["reddit"].map((x) => x)),
        sourceCode: List<String>.from(json["source_code"].map((x) => x)),
        website: List<String>.from(json["website"].map((x) => x)),
        youtube: List<String>.from(json["youtube"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "explorer": List<dynamic>.from(explorer.map((x) => x)),
        "facebook": List<dynamic>.from(facebook.map((x) => x)),
        "reddit": List<dynamic>.from(reddit.map((x) => x)),
        "source_code": List<dynamic>.from(sourceCode.map((x) => x)),
        "website": List<dynamic>.from(website.map((x) => x)),
        "youtube": List<dynamic>.from(youtube.map((x) => x)),
      };
}

class LinksExtended {
  String url;
  String type;
  Stats? stats;

  LinksExtended({
    required this.url,
    required this.type,
    this.stats,
  });

  factory LinksExtended.fromJson(Map<String, dynamic> json) => LinksExtended(
        url: json["url"],
        type: json["type"],
        stats: json["stats"] == null ? null : Stats.fromJson(json["stats"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "type": type,
        "stats": stats?.toJson(),
      };
}

class Stats {
  int? subscribers;
  int? contributors;
  int? stars;
  int? followers;

  Stats({
    this.subscribers,
    this.contributors,
    this.stars,
    this.followers,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => Stats(
        subscribers: json["subscribers"],
        contributors: json["contributors"],
        stars: json["stars"],
        followers: json["followers"],
      );

  Map<String, dynamic> toJson() => {
        "subscribers": subscribers,
        "contributors": contributors,
        "stars": stars,
        "followers": followers,
      };
}

class Tag {
  String id;
  String name;
  int coinCounter;
  int icoCounter;

  Tag({
    required this.id,
    required this.name,
    required this.coinCounter,
    required this.icoCounter,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        id: json["id"],
        name: json["name"],
        coinCounter: json["coin_counter"],
        icoCounter: json["ico_counter"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "coin_counter": coinCounter,
        "ico_counter": icoCounter,
      };
}

class Team {
  String id;
  String name;
  String position;

  Team({
    required this.id,
    required this.name,
    required this.position,
  });

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        id: json["id"],
        name: json["name"],
        position: json["position"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
      };
}

class Whitepaper {
  String link;
  String thumbnail;

  Whitepaper({
    required this.link,
    required this.thumbnail,
  });

  factory Whitepaper.fromJson(Map<String, dynamic> json) => Whitepaper(
        link: json["link"],
        thumbnail: json["thumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "thumbnail": thumbnail,
      };
}

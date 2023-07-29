// import 'package:meta/meta.dart';
// import 'dart:convert';
//
// UsersPets usersPetsFromJson(String str) => UsersPets.fromJson(json.decode(str));
//
// String usersPetsToJson(UsersPets data) => json.encode(data.toJson());
//
// class UsersPets {
//   final List<Element> elements;
//
//   UsersPets({
//     required this.elements,
//   });
//
//   factory UsersPets.fromJson(Map<String, dynamic> json) => UsersPets(
//     elements: List<Element>.from(json["elements"].map((x) => Element.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "elements": List<dynamic>.from(elements.map((x) => x.toJson())),
//   };
// }
//
// class Element {
//   final String? name;
//   final double? atomicMass;
//   final String? category;
//   final int? number;
//   final String? source;
//   final String? summary;
//   final String? symbol;
//   final int? xpos;
//   final int? ypos;
//
//   Element({
//     required this.name,
//     required this.atomicMass,
//     required this.category,
//     required this.number,
//     required this.source,
//     required this.summary,
//     required this.symbol,
//     required this.xpos,
//     required this.ypos,
//   });
//
//   factory Element.fromJson(Map<String, dynamic> json) => Element(
//     name: json["name"],
//     atomicMass: json["atomic_mass"].toDouble(),
//     category: json["category"],
//     number: json["number"],
//     source: json["source"],
//     summary: json["summary"],
//     symbol: json["symbol"],
//     xpos: json["xpos"],
//     ypos: json["ypos"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "name": name,
//     "atomic_mass": atomicMass,
//     "category": category,
//     "number": number,
//     "source": source,
//     "summary": summary,
//     "symbol": symbol,
//     "xpos": xpos,
//     "ypos": ypos,
//   };
// }



import 'package:meta/meta.dart';
import 'dart:convert';

ElementInfo elementInfoFromJson(String str) => ElementInfo.fromJson(json.decode(str));

String elementInfoToJson(ElementInfo data) => json.encode(data.toJson());

class ElementInfo {
  final List<Element> elements;

  ElementInfo({
    required this.elements,
  });

  factory ElementInfo.fromJson(Map<String, dynamic> json) => ElementInfo(
    elements: List<Element>.from(json["elements"].map((x) => Element.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "elements": List<dynamic>.from(elements.map((x) => x.toJson())),
  };
}

class Element {
  final String? nameEn;
  final String? nameRu;
  final String? nameUz;
  final double? atomicMass;
  final String? category;
  final int? number;
  final String? source;
  final String? summaryEn;
  final String? summaryRu;
  final String? summaryUz;
  final String? symbol;
  final int? xpos;
  final int? ypos;
  final String? summary;

  Element({
    required this.nameEn,
    required this.nameRu,
    required this.nameUz,
    required this.atomicMass,
    required this.category,
    required this.number,
    required this.source,
    required this.summaryEn,
    required this.summaryRu,
    required this.summaryUz,
    required this.symbol,
    required this.xpos,
    required this.ypos,
    required this.summary,
  });

  factory Element.fromJson(Map<String, dynamic> json) => Element(
    nameEn: json["name_en"],
    nameRu: json["name_ru"],
    nameUz: json["name_uz"],
    atomicMass: json["atomic_mass"].toDouble(),
    category: json["category"],
    number: json["number"],
    source: json["source"],
    summaryEn: json["summary_en"],
    summaryRu: json["summary_ru"],
    summaryUz: json["summary_uz"],
    symbol: json["symbol"],
    xpos: json["xpos"],
    ypos: json["ypos"],
    summary: json["summary"],
  );

  Map<String, dynamic> toJson() => {
    "name_en": nameEn,
    "name_ru": nameRu,
    "name_uz": nameUz,
    "atomic_mass": atomicMass,
    "category": category,
    "number": number,
    "source": source,
    "summary_en": summaryEn,
    "summary_ru": summaryRu,
    "summary_uz": summaryUz,
    "symbol": symbol,
    "xpos": xpos,
    "ypos": ypos,
    "summary": summary,
  };
}


// To parse this JSON data, do
//
//     final searchResultModel = searchResultModelFromJson(jsonString);

import 'dart:convert';

SearchResultModel searchResultModelFromJson(String str) => SearchResultModel.fromJson(json.decode(str));

String searchResultModelToJson(SearchResultModel data) => json.encode(data.toJson());

class SearchResultModel {
  SearchResultModel({
    required this.totalData,
    required this.currentPageTotalData,
    required this.totalPages,
    required this.currentPage,
    required this.results,
  });

  int totalData;
  int currentPageTotalData;
  int totalPages;
  int currentPage;
  List<Result> results;

  factory SearchResultModel.fromJson(Map<String, dynamic> json) => SearchResultModel(
    totalData: json["total_data"],
    currentPageTotalData: json["current_page_total_data"],
    totalPages: json["total_pages"],
    currentPage: json["current_page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total_data": totalData,
    "current_page_total_data": currentPageTotalData,
    "total_pages": totalPages,
    "current_page": currentPage,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    required this.id,
    required this.pid,
    required this.title,
    required this.meaning,
    required this.keywords,
    required this.length,
    required this.author,
    required this.status,
    required this.resultPart,
    required this.score,
    required this.score2,
  });

  String id;
  String pid;
  String title;
  String meaning;
  String keywords;
  String length;
  Author author;
  Status status;
  String resultPart;
  String score;
  String score2;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    pid: json["pid"],
    title: json["title"],
    meaning: json["meaning"],
    keywords: json["keywords"],
    length: json["length"],
    author: authorValues.map[json["author"]]!,
    status: statusValues.map[json["status"]]!,
    resultPart: json["part"],
    score: json["score"],
    score2: json["score2"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pid": pid,
    "title": title,
    "meaning": meaning,
    "keywords": keywords,
    "length": length,
    "author": authorValues.reverse[author],
    "status": statusValues.reverse[status],
    "part": resultPart,
    "score": score,
    "score2": score2,
  };
}

enum Author { IBN_SIRIN, VARIOUS_ISLAMIC_SCHOLARS }

final authorValues = EnumValues({
  "Ibn Sirin": Author.IBN_SIRIN,
  "Various Islamic Scholars": Author.VARIOUS_ISLAMIC_SCHOLARS
});

enum Status { STRONG, WEAK }

final statusValues = EnumValues({
  "STRONG": Status.STRONG,
  "WEAK": Status.WEAK
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

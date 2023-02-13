import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myislamicdream/modules/details/details_controller.dart';
import 'package:get/get.dart';

import '../models/details/search_result_model.dart';

class CustomSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => "Describe your dream";
  DetailsController _detailsController = Get.put(DetailsController());

  final searchTerms = [].obs;
  final resultTerms = [].obs;

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }
  callBack () async{
    await _detailsController.getResult(query, _detailsController.page).then((val) {
      _detailsController.resultList.value =
          searchResultModelFromJson(jsonEncode(val));
    });
    resultTerms.value = _detailsController.resultList.value!.results;
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Result> matchQuery = [];
    callBack();


    //
    // void scrollListener(){
    //   _detailsController.scroll.addListener(() async{
    //     if(_detailsController.scroll.position.maxScrollExtent == _detailsController.scroll.position.pixels){
    //       _detailsController.page.value = _detailsController.page.value+1;
    //       await _detailsController.getResult(query,_detailsController.page.value);
    //     }
    //
    //   });
    // }

    for (var fruit in _detailsController.resultList.value!.results) {
      if (fruit.title.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);

      }
      print(matchQuery);
    }
    //scrollListener();

    //if (query.isNotEmpty && matchQuery.contains(query.toLowerCase())) {
      return ListView.builder(
          controller: _detailsController.scroll,
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            var result = matchQuery[index];
            print("This is result term $resultTerms");
            return ListTile(
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0),
                child: Text(
                  result.title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'Roboto'),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
                child: Text(
                    result.meaning,
                    //"lorem ipsum thiis is the future and this the the past",
                    style: TextStyle(fontSize: 16, fontFamily: 'Roboto')),
              ),
            );
          });
    //}
    // else if (query == "") {
    //   return Text("");
    // }
    // return ListTile(
    //   title: Text("No Data Found"),
    // );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final matchQuery = [].obs;

    _detailsController.getSuggest(query).then((val) {
      _detailsController.suggestList.value = val;
    });
    searchTerms.value = _detailsController.suggestList.value;

    for (var fruit in searchTerms.value) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return Obx(() {
        return ListView.builder(
            itemCount: matchQuery.length,
            itemBuilder: (context, index) {
              var suggestion = matchQuery[index];
              return ListTile(
                title: Text(suggestion),
                onTap: () {
                  query = suggestion;
                  showResults(context);
                },
              );
            });
      }
    );
  }
}

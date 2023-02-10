import 'package:flutter/material.dart';
import 'package:myislamicdream/modules/details/details_controller.dart';
import 'package:get/get.dart';

class CustomSearchDelegate extends SearchDelegate{
  DetailsController _detailsController = Get.put(DetailsController());

  List<dynamic> searchTerms = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(onPressed: (){
        if(query.isEmpty){
          close(context, null);
        }else{
          query = '';
        }
      }, icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: (){
      close(context, null);
    }, icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(itemCount: matchQuery.length, itemBuilder: (context, index){
      var result = matchQuery[index];
      return ListTile(
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
          child: Text(
            result,
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
              "Lorem Ipsum is simply dummy text of the printing and typesetting  survived not only five centuries",
              style: TextStyle(
                  fontSize: 16, fontFamily: 'Roboto')),
        ),
      );
    });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];

    _detailsController.getSuggest(query).then((val){
      _detailsController.suggestList.value = val;
    });
    searchTerms = _detailsController.suggestList.value;

    for(var fruit in searchTerms){
      if(fruit.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(itemCount: matchQuery.length, itemBuilder: (context, index){
      var suggestion = matchQuery[index];
      return ListTile(
        title: Text(suggestion),
        onTap: (){
          query = suggestion;
          showResults(context); 
        },

      );
    });
  }
  
}
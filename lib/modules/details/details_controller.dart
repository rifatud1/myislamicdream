import 'package:get/get.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class DetailsController extends GetxController {
  var suggestList = [].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  //
  // void getSuggestion(query) async{
  //   var  suggestions = await RemoteServices.getSuggest(query);
  //   if(suggestions != null){
  //     suggestList.value = suggestions;
  //   }
  // }

  Future<dynamic> getSuggest(query) async{
    var response = await http.get(Uri.parse('https://www.myislamicdream.com/api/get-search-suggest.php?search=$query'));
    if(response.statusCode == 200 && response.statusCode != null){
      print("reponse successful");
      print(response.body);
      var jsonString  = response.body;
      var res = convert.jsonDecode(jsonString);
      var  suggestions = res;
      if(suggestions != null){
        suggestList.value = suggestions;
      }
      return res;
    }else{
      print("Respoonse Unsuccessful, api call failed");
      return null;
    }

  }

}
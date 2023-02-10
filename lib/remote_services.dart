

import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class RemoteServices {
  //static var client = http.Client();
  static Future<dynamic> getSuggest(query) async{
    var response = await http.get(Uri.parse('https://www.myislamicdream.com/api/get-search-suggest.php?search=$query'));
    if(response.statusCode == 200 && response.statusCode != null){
      print("reponse successful");
      print(response.body);
      var jsonString  = response.body;
      var res = convert.jsonDecode(jsonString);
      return res;
    }else{
      print("Respoonse Unsuccessful, api call failed");
      return null;
    }

  }
}
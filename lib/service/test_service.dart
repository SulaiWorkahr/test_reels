
import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

class TestService {


String liveApiPath = 'https://dummyjson.com/';
   static String appApiPath = '';
  final client = http.Client();

 static var headerData = {
    'Content-Type': 'application/json',
    'Accept': 'application/json ',
  };
 

//get all json data
  Future getData() async {
    try {
      final url = Uri.parse('${liveApiPath}products/1');
      final response = await client.get(
        url,
        headers: headerData,
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return [];
      }
    } catch (e) {
      return e;
    }
  }

}
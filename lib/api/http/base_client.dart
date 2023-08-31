import 'dart:convert';

import 'package:http/http.dart'as http;
const String baseUrl='https://631c37911b470e0e12fcdd0b.mockapi.io/api';
class BaseClientService{
  var client=http.Client();
  Future<dynamic> getUser(String api)async{
    // var header={
    //   //'Authorization': 'Bearer sfie328370428387=',
    //   //'api_key': 'ief873fj38uf38uf83u839898989',
    // };
    var url=Uri.parse(baseUrl+api);
    var response=await client.get(url);
    if(response.statusCode==200){
      return response.body;
    }else{

    }
  }
  Future<dynamic> postUser(String api,dynamic object)async{
    var _headers = {
      //'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      //'api_key': 'ief873fj38uf38uf83u839898989',
    };
    var payload=jsonEncode(object);
    var url=Uri.parse(baseUrl+api);
    var response=await client.post(url,body: payload,headers: _headers);
    if(response.statusCode==201){
      return response.body;
    }else{

    }
  }
  Future<dynamic> putUser(String api,dynamic object)async{
    var _headers = {
      //'Authorization': 'Bearer sfie328370428387=',
      'Content-Type': 'application/json',
      //'api_key': 'ief873fj38uf38uf83u839898989',
    };
    var payload=jsonEncode(object);
    var url=Uri.parse(baseUrl+api);
    var response=await client.put(url,body: payload,headers: _headers);
    if(response.statusCode==200){
      return response.body;
    }else{

    }
  }
  Future<dynamic> deleteUser(String api)async{
    // var header={
    //   //'Authorization': 'Bearer sfie328370428387=',
    //   //'api_key': 'ief873fj38uf38uf83u839898989',
    // };
    var url=Uri.parse(baseUrl+api);
    var response=await client.delete(url);
    if(response.statusCode==200){
      return response.body;
    }else{

    }
  }
}
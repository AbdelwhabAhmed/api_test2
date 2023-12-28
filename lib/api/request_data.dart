import 'dart:convert';
import 'dart:math';

import 'package:apis_test2/model/newsModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart ' as http;
class ApiService{
  Future<List<NewsModle>> getData()async{
   try{
     final url =Uri.parse('https://newsapi.org/v2/top-headlines?country=us&category=sports&apiKey=34d32fd0520d48eabf8a5a4b2e7bfd04');
     final response = await http.get(url);

     if (response.statusCode == 200) {
       final body = response.body;
       final data = jsonDecode(body) as Map<String, dynamic>;
       final List<NewsModle> newsList = (data['articles'] as List)
           .map((article) => NewsModle.fromJson(article))
           .toList();
       return newsList;
       print(data);
     }
     else {
       print(response.reasonPhrase);
       print(response.statusCode);
     }
   }catch(e){
     debugPrint('Error fetching data: $e');   }
   throw const FormatException('Error fetching data from the API: $e');

  }
}
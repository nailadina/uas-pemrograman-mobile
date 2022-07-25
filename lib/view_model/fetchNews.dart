
// ignore_for_file: camel_case_types, file_names, avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uas1/model/news.dart';

class net {
  final indo = 'https://61bc7694d8542f001782476b.mockapi.io/api/indoNews';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(indo));
      print(response.body);
      if(response.statusCode == 200){
        Iterable it = jsonDecode(response.body);
        List<news1> aa = it.map((e) => news1.fromJson(e)).toList();
        return aa;

      }
    } catch (e) {
      print(e.toString());
    }
  }
}
class net1{
  final sport = 'https://61bc7694d8542f001782476b.mockapi.io/api/sportNews';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(sport));
      print(response.body);
      if(response.statusCode == 200){
        Iterable it = jsonDecode(response.body);
        List<news2> aa = it.map((e) => news2.fromJson(e)).toList();
        return aa;

      }
    } catch (e) {
      print(e.toString());
    }
  }
}
class net2 {
  final tekno = 'https://61bc7694d8542f001782476b.mockapi.io/api/teknoNews';
  Future getData() async {
    try {
      final response = await http.get(Uri.parse(tekno));
      print(response.body);
      if(response.statusCode == 200){
        Iterable it = jsonDecode(response.body);
        List<news3> aa = it.map((e) => news3.fromJson(e)).toList();
        return aa;

      }
    } catch (e) {
      print(e.toString());
    }
  }
}

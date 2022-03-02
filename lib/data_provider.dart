import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataProvider {
  static List facultiesList = [];

  static Future<List> getFaculties() async {
    await Future.delayed(const Duration(seconds: 2));
    var url = Uri.parse('http://192.168.1.250:8000/faculty-list/');
    var res = await http.get(url);
    facultiesList = jsonDecode(res.body);
    log("$facultiesList", name: "GET FACULTIES");
    return facultiesList;
  }

  static Future<Map> getFaculty(int pk) async {
    await Future.delayed(const Duration(seconds: 2));
    var url = Uri.parse('http://192.168.1.250:8000/faculty/$pk/');
    var res = await http.get(url);
    Map tmp = jsonDecode(res.body);
    log("$tmp", name: "GET FACULTY");
    return tmp;
  }
}

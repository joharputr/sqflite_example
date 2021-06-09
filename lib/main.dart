import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqlite/database/database.dart';
import 'package:sqlite/model/country_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DbHelper _helper = new DbHelper();
  List<Country> _listCountry = [];

  @override
  void initState() {
    super.initState();
    Map<String, Object> data = {"name": "sd"};
    _helper.insert(CountryQuery.TABLE_NAME, data);
    _helper.getData(CountryQuery.TABLE_NAME).then((value) {
      value.forEach((element) {
        Country country = Country.fromJson(element);
        print(country.toJson());
        _listCountry.add(country);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Text("${_listCountry[index].name}");
          },
          itemCount: _listCountry.length,
        ),
      ),
    );
  }
}

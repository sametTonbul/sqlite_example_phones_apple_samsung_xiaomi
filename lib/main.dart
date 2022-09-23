import 'package:flutter/material.dart';
import 'package:flutter_phone_sqlite/apple.dart';
import 'package:flutter_phone_sqlite/phoneAppleDAO.dart';
import 'package:flutter_phone_sqlite/phoneSamsungDAO.dart';
import 'package:flutter_phone_sqlite/phoneXiaomi.dart';
import 'package:flutter_phone_sqlite/samsung.dart';
import 'package:flutter_phone_sqlite/xiaomi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> showApplePhones() async {
    var listApple = await phoneAppleDAO().allPhones();
    for (Apple index in listApple) {
      print('Phone id: ${index.phone_id}');
      print('Phone model: ${index.phone_model}');
      print('Phone year: ${index.phone_year}');
      print('Phone software: ${index.phone_software}');
    }
  }

  Future<void> showSamsungPhones() async {
    var listSamsung = await phoneSamsungDAO().allPhones();
    for (Samsung index in listSamsung) {
      print('Phone id: ${index.phone_id}');
      print('Phone model: ${index.phone_model}');
      print('Phone year: ${index.phone_year}');
      print('Phone software: ${index.phone_software}');
    }
  }

  Future<void> showXiaomiPhones() async {
    var listXiaomi = await phoneXiaomiDAO().allPhones();
    for (Xiaomi index in listXiaomi) {
      print('Phone id: ${index.phone_id}');
      print('Phone model: ${index.phone_model}');
      print('Phone year: ${index.phone_year}');
      print('Phone software: ${index.phone_software}');
    }
  }

  @override
  void initState() {
    super.initState();
    showApplePhones();
    showSamsungPhones();
    showXiaomiPhones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PhonesSQLite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}

// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

import 'package:flutter_form_application/adddatawidget.dart';
import 'dart:async';
import 'package:flutter_form_application/model/cases.dart';
import 'package:flutter_form_application/services/api_service.dart';
import 'package:flutter_form_application/caseslist.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService api = ApiService();
  late List<Cases> casesList = List<Cases>.empty();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: new Center(
            child: new FutureBuilder(
          future: loadList(),
          builder: (context, snapshot) {
            return casesList.isNotEmpty
                ? new CasesList(cases: casesList)
                : const Center(
                    child: Text('No data found, tap plus button to add!'));
          },
        )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAddScreen(context);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future loadList() {
    Future<List<Cases>> futureCases = api.getCases();

    futureCases.then((casesList) {
      setState(() {
        this.casesList = casesList;
      });
    });
    return futureCases;
  }

  _navigateToAddScreen(BuildContext context) async {
    // ignore: unused_local_variable
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AddDataWidget()),
    );
  }
}

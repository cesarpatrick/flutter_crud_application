// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter_form_application/model/cases.dart';
import 'database_handler.dart';

class ApiService {
  final DatabaseHandler databaseHandler = DatabaseHandler();

  Future<List<Cases>> getCases() async {
    return databaseHandler.retrieveCases();
  }

  Future<Cases> getCaseById(String id) async {
    return databaseHandler.retrieveCaseById(id);
  }

  Future createCase(Cases cases) async {
    databaseHandler.insertCase(cases);
  }

  Future updateCases(String id, Cases cases) async {
    databaseHandler.updateCase(id, cases);
  }

  Future<void> deleteCase(String id) async {
    databaseHandler.deleteCase(id);
  }
}

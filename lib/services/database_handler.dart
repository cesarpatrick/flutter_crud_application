import 'package:flutter_form_application/model/cases.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHandler {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'example.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE cases(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL, gender TEXT NOT NULL, age TEXT NOT NULL, address TEXT NOT NULL, city TEXT NOT NULL, country TEXT NOT NULL, status TEXT, updated DATETIME DEFAULT CURRENT_TIMESTAMP)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertCase(Cases object) async {
    int result = 0;
    final Database db = await initializeDB();

    await db.execute(
        "insert into cases(name, gender, status, age, address, city, country) values ('" +
            object.name! +
            "','" +
            object.gender! +
            "','" +
            object.status! +
            "'," +
            object.age! +
            ",'" +
            object.address! +
            "','" +
            object.city! +
            "','" +
            object.country! +
            "')");

    //result = await db.insert('cases', object.toMap());

    return result;
  }

  Future<List<Cases>> retrieveCases() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('cases');
    return queryResult.map((e) => Cases.fromMap(e)).toList();
  }

  Future<Cases> retrieveCaseById(String id) async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query(
      'cases',
      where: "id = ?",
      whereArgs: [id],
    );
    return queryResult.map((e) => Cases.fromMap(e)).first;
  }

  Future<void> deleteCase(String id) async {
    final db = await initializeDB();
    await db.delete(
      'cases',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future<int> updateCase(String id, Cases object) async {
    int result = 0;
    final Database db = await initializeDB();

    Map<String, dynamic> row = {
      'name': object.name,
      'gender': object.gender,
      'age': object.age,
      'status': object.status,
      'country': object.country,
      'city': object.city,
      'address': object.address
    };

    await db.update(
      'cases',
      row,
      where: "id = ?",
      whereArgs: [id],
    );

    return result;
  }
}

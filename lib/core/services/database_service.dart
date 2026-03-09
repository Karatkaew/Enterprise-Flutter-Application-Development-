import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseService {

  static Database? _db;

  static Future<Database> database() async {

    if (_db != null) return _db!;

    final path = join(await getDatabasesPath(), 'expense.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(
          '''
          CREATE TABLE expenses(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            amount REAL
          )
          '''
        );
      },
    );

    return _db!;
  }
}
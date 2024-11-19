import 'package:core/core.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  static Database? _database;
  static final int _databaseVersion = 1;
  static final table = 'myTable';
  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  DatabaseConfig._privateConstructor();

  static final DatabaseConfig instance = DatabaseConfig._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    _database = await openDatabase(
      StorageConstants.receiptDatabaseName,
      version: _databaseVersion,
      onCreate: (Database db, int version) {
        db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnName TEXT NOT NULL,
            $columnAge INTEGER NOT NULL
          )
          ''');
      },
    );

    return _database!;
  }

  Future<void> closeDatabase() async {
    await _database?.close();
  }
}

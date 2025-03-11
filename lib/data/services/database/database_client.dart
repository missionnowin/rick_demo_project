import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseClient {
  static const String _databaseName = 'app_database.db';
  static const int _databaseVersion = 1;

  late final Database _database;
  Database get database => _database;

  DatabaseClient() {
    _initDatabase().then((db) => _database = db);
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _databaseName);

    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE characters (
        id INTEGER PRIMARY KEY,
        name TEXT,
        isFavorite INTEGER,
        status TEXT,
        species TEXT,
        type TEXT,
        gender TEXT,
        origin TEXT,
        location TEXT,
        image TEXT,
        episodes TEXT,
        created TEXT
      )
    ''');
  }
}
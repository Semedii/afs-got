import 'package:afs_gpt/database/prompt_database.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    return await _initDatabase();
  }

  Future<Database>  _initDatabase() async{
    const name = 'prompt.db';
    final path = await getDatabasesPath();
    var database = await openDatabase('$name/$path', version: 1, onCreate: create, singleInstance: true);
    return database;
  }

  Future<void> create(Database database, int version)async{
    await PromptDb().createTable(database);
  }
}

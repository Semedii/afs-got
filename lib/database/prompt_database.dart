import 'package:afs_gpt/database/database_service.dart';
import 'package:afs_gpt/model/prompt.dart';
import 'package:sqflite/sqflite.dart';

class PromptDb {
  final tableName = 'prompts';

  Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS $tableName (
    "response" TEXT,
    "isFavorite" BOOLEAN

    );""");
  }

  Future<int> create({required String response}) async {
    final database = await DatabaseService().database;
    return await database.rawInsert(
        '''INSERT INTO $tableName (response,isFavorite) VALUES (?,?) ''',
        [response, false]);
  }

  Future<List<Prompt>> fetchAll() async {
    final database = await DatabaseService().database;
    final prompts = await database.rawQuery(''' SELECT * from $tableName  ''');
    return prompts.map((prompt) => Prompt.fromSqfliteDatabase(prompt)).toList();
  }
}

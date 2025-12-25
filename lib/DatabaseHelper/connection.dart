import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter_bloc_sqlite_learning/DatabaseHelper/tables.dart';

class DatabaseHelper{
  final databaseName = "note.db";

  Future<Database>initDatabase()async{
    final databasePath = await getApplicationDocumentsDirectory();
    final path = join(databasePath.path,databaseName);
    return openDatabase(path,version:1,onCreate:(db,version)async{
      //table to execute
      await db.execute(Tables.noteTable);
    });
  }
}
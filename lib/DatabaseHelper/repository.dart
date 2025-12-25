import 'package:flutter_bloc_sqlite_learning/DatabaseHelper/connection.dart';
import 'package:flutter_bloc_sqlite_learning/DatabaseHelper/tables.dart';

import '../models/notes.dart';

class Repository {
  final DatabaseHelper databaseHelper = DatabaseHelper();
  //Get Notes
  Future<List<Note>> getNotes() async {
    final db = await databaseHelper.initDatabase();
    final List<Map<String, Object?>> notes = await db.query(
      Tables.noteTableName,
    );
    return notes.map((e) => Note.fromMap(e)).toList();
  }

  //Add Notes
  Future<int> addNotes(Note notes) async {
    final db = await databaseHelper.initDatabase();
    return db.insert(Tables.noteTableName, notes.toMap());
  }

  Future<int> updateNote(Note notes) async {
    final db = await databaseHelper.initDatabase();
    return db.update(
      Tables.noteTableName,
      notes.toMap(),
      where: "noteID = ?",
      whereArgs: [notes.id],
    );
  }



  //Delete Notes
  Future<int> deleteNotes(int id) async {
    final db = await databaseHelper.initDatabase();
    return db.delete(
      Tables.noteTableName,
      where: "noteId = ?",
      whereArgs: [id],
    );
  }

  Future<Note>getNoteById(int id)async{
    final db = await databaseHelper.initDatabase();
    final note = await db.query(Tables.noteTableName,where: "noteId = ?",
    whereArgs: [id]
    );
    if(note.isNotEmpty){
      return Note.fromMap(note.first);
    }else{
      throw Exception('Note $id not found');
    }
  }
}

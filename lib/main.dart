import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sqlite_learning/DatabaseHelper/repository.dart';
import 'package:flutter_bloc_sqlite_learning/bloc/note_bloc.dart';
import 'package:flutter_bloc_sqlite_learning/view/notes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>NoteBloc(Repository())..add(GetAllNoteEvent()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
      
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const AllNotes(),
      ),
    );
  }
}


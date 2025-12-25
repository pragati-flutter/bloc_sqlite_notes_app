import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sqlite_learning/bloc/note_bloc.dart';
import 'package:flutter_bloc_sqlite_learning/models/notes.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final content = TextEditingController();
    String createdAt = DateTime.now().toIso8601String();
    return BlocConsumer<NoteBloc,NoteState>(
      builder: (BuildContext context, NoteState state) {

       return Scaffold(
          appBar: AppBar(
            title: Text("Add Note"),
            actions: [
              IconButton(
                onPressed: () {
                  context.read<NoteBloc>().add(
                    AddNoteEvent(
                      Note(
                        title: title.text,
                        content: content.text,
                        createdAt:createdAt.toString() ,
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.check),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                TextField(
                  controller: title,
                  decoration: InputDecoration(hintText: "Title"),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: content,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: "Content",
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          ),
        );
      },
      listener: (BuildContext context, NoteState state) {
        if(state is SuccessNoteInsertion){
          Navigator.of(context).pop();
        }
      },
    );
  }
}

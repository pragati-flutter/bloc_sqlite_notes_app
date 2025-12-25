import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sqlite_learning/bloc/note_bloc.dart';
import 'package:flutter_bloc_sqlite_learning/models/notes.dart';

class UpdateNote extends StatefulWidget {
  const UpdateNote({super.key});

  @override
  State<UpdateNote> createState() => _UpdateNoteState();
}

class _UpdateNoteState extends State<UpdateNote> {
  @override
  Widget build(BuildContext context) {
    final title = TextEditingController();
    final content = TextEditingController();
    String createdAt = DateTime.now().toIso8601String();
   int? id ;
    return BlocConsumer<NoteBloc, NoteState>(
      builder: (BuildContext context, NoteState state) {
        if(state is GetNoteByIdState){
          title.text = state.notes.title;
          content.text = state.notes.content;
          id = state.notes.id;
          return Scaffold(
            appBar: AppBar(
              title: Text("Edit Note"),
              leading: IconButton(onPressed: (){
                Navigator.of(context).pop();
                context.read<NoteBloc>().add(GetAllNoteEvent());
              }, icon: Icon(
                Icons.arrow_back_ios_new_rounded
              )),
              actions: [
                state is LoadingState?Center(
                  child: CircularProgressIndicator(),
                ):
                IconButton(
                  onPressed: () {
                    print("update notes data is given by..${title.text} and ${content.text}  and ${createdAt} ");
                    context.read<NoteBloc>().add(
                      UpdateNoteEvent(
                        Note(
                          id: id,
                          title: title.text,
                          content: content.text,
                          createdAt: createdAt,
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
        }
         return Container();

      },
      listener: (BuildContext context, NoteState state) {
        if (state is SuccessNoteUpdate) {
          Navigator.of(context).pop();
        }
      },
    );
  }
}

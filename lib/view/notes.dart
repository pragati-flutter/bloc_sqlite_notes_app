import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sqlite_learning/bloc/note_bloc.dart';
import 'package:flutter_bloc_sqlite_learning/view/add_notes.dart';
import 'package:flutter_bloc_sqlite_learning/view/update_notes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:intl/intl.dart';

class AllNotes extends StatefulWidget {
  const AllNotes({super.key});

  @override
  State<AllNotes> createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<NoteBloc>().add(GetAllNoteEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddNotes()),
          );
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(title: Text("AllNotes")),
      body: BlocConsumer<NoteBloc, NoteState>(
        listener: (context, state) {
          if(state is GetNoteByIdState){
/*
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const AddNotes()),
            );
*/
          }
        },
        builder: (context, state) {
          if (state is LoadedState) {
            return state.allNotes.isEmpty
                ? Center(child: Text("No Data"))
                : MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                    itemCount: state.allNotes.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: (){
                          context.read<NoteBloc>().add(GetNotesByIdEvent(state.allNotes[index].id!));
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>UpdateNote()));
                        },
                        child: Container(
                          margin: EdgeInsets.all(8),
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.allNotes[index].title,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(state.allNotes[index].content),
                              Row(
                                children: [
                                  Text(
                                    dateFormat(state.allNotes[index].createdAt),
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Spacer(),
                                  InkWell(
                                    onTap: (){
                                      context.read<NoteBloc>().add(DeleteNoteEvent(state.allNotes[index].id!));
                                    },
                                    child: Icon(
                                      Icons.delete,color: Colors.black,size: 20,),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
          }
          return Container();
        },
      ),
    );
  }

  String dateFormat(String data) {
    final DateFormat dateFormat = DateFormat("H:mm aa");
    return dateFormat.format(DateTime.parse(data));
  }
}

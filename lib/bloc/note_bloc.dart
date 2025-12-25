import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_sqlite_learning/DatabaseHelper/repository.dart';

import '../models/notes.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final Repository repository;

  NoteBloc(this.repository) : super(NoteInitial()) {
    //Event controllers
    on<GetAllNoteEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final notes = await repository.getNotes();
        emit(LoadedState(notes));
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });
// add notes
    on<AddNoteEvent>((event, emit) async {
      emit(LoadingState());
      try {
        Future.delayed(const Duration(seconds: 1));
        int res = await repository.addNotes(
          Note(
            title: event.notes.title,
            content: event.notes.content,
            createdAt: event.notes.createdAt,
          ),
        );
        if (res > 0) {
          emit(SuccessNoteInsertion());
          add(GetAllNoteEvent());
        }
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });
    //Get note by Id
    on<GetNotesByIdEvent>((event, emit) async {
      print("hey i am in calling process");
      print("event id is given by ${event.id}");
      final notes = await repository.getNoteById(event.id);
      emit(GetNoteByIdState(notes));
    });
    //Update note
    on<UpdateNoteEvent>((event, emit) async {
      print("Hey i am called");

      try {
        print("Hey i am called");

        if(event.notes.id == null){
          print("id is null ${event.notes.id}");
          throw Exception("noteId is null. Cannot update note.");

        }
print("Hey i am called");
        final notes = await repository.updateNote(
          Note(
            id: event.notes.id,
            title: event.notes.title,
            content: event.notes.content,
            createdAt: event.notes.createdAt,
          ),

        );

      print("notes count is given by....${notes}");
        if(notes>0){
          emit(SuccessNoteUpdate());
          add(GetAllNoteEvent());
        }
      } catch (e) {
        emit(FailureState(e.toString()));
      }
    });
    //Delete note
    on<DeleteNoteEvent>((event,emit)async{
      try{
      final res = await repository.deleteNotes(event.id);
      if(res>0){
        emit(SuccessNoteDelete());
        add(GetAllNoteEvent());
      }

      }catch(e){
       FailureState(e.toString());
      }
    });
  }
}

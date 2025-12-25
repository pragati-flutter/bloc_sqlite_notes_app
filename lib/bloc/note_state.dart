part of 'note_bloc.dart';

sealed class NoteState extends Equatable{
  const NoteState();
}

final class NoteInitial extends NoteState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
final class LoadingState extends NoteState{
  @override
  List<Object?> get props => [];

}
//get all notes
final class LoadedState extends NoteState{
  final List<Note>allNotes;
  const LoadedState(this.allNotes);
  @override
  List<Object?> get props => [];

}
// In case when there is an error
final class FailureState extends NoteState{
  final String errorMessage;
  const FailureState(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];

}
//Success Note Add Insertion
final class SuccessNoteInsertion extends NoteState{
  @override
  List<Object?> get props => [];

}

final class GetNoteByIdState extends NoteState{
  final Note notes;
  const GetNoteByIdState(this.notes);
  @override
  List<Object?> get props => [notes];

}

final class SuccessNoteUpdate extends NoteState{
  @override
  List<Object?> get props => [];

}
final class SuccessNoteDelete extends NoteState{
  @override
  List<Object?> get props => [];

}

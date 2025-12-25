part of 'note_bloc.dart';

sealed class NoteEvent extends Equatable{
  const NoteEvent();
}


class GetAllNoteEvent extends NoteEvent{
  @override

  List<Object?> get props => [];

}

class AddNoteEvent extends NoteEvent{
  final Note notes;
  const AddNoteEvent(this.notes);
  @override
  List<Object?> get props => [notes];

}

class UpdateNoteEvent extends NoteEvent{
  final Note notes ;
  const UpdateNoteEvent(this.notes);

  @override
  List<Object?> get props => [notes];

}

class DeleteNoteEvent extends NoteEvent{
  final int id;

  const DeleteNoteEvent(this.id);

  @override

  List<Object?> get props => [id];

}

class GetNotesByIdEvent extends NoteEvent{
  final int id;
  const GetNotesByIdEvent(this.id);

  @override
  // TODO: implement props
  List<Object?> get props => [];

}
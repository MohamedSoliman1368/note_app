
import '../../models/note_model.dart';

class NoteState{}
class NoteInitial extends NoteState{}
class NoteLoaded extends NoteState{
  final List<NoteModel> notes;
  NoteLoaded(this.notes);
}
class NoteSuccess extends NoteState{}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/models/note_model.dart';

import 'add_note_state.dart';

class AddNote extends Cubit <AddNoteState>{
  AddNote(super.initialState);

  addNote(NoteModel note){}
}
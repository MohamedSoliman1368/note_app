import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note/models/note_model.dart';

import '../../constants.dart';
import 'add_note_state.dart';

class AddNote extends Cubit <AddNoteState>{
  AddNote(super.initialState);

  addNote(NoteModel note){
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      notesBox.add(note);
      emit(AddNoteSuccess());
    } catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }
}
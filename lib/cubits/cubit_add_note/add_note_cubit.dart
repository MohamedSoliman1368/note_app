import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:note/models/note_model.dart';

import '../../constants.dart';
import 'add_note_state.dart';

class AddNoteCubit extends Cubit <AddNoteState>{
  AddNoteCubit() : super(AddNoteInitial());
  Color color = const Color(0xffAC3931);
  addNote(NoteModel note)async{
    note.color = color.value;
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
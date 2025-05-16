import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../constants.dart';
import '../../models/note_model.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteState>{
  NoteCubit() : super(NoteInitial());


  addNote(NoteModel note){
    try {
      var notesBox = Hive.box<NoteModel>(kNoteBox);
      notesBox.add(note);
      emit(NoteSuccess(
        notesBox.values.toList(),
      ));
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }

}
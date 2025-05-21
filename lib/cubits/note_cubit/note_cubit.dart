import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../constants.dart';
import '../../models/note_model.dart';
import 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  List<NoteModel> allNotes = [];

  void fetchNotes() {
    var notesBox = Hive.box<NoteModel>(kNoteBox);
    allNotes = notesBox.values.toList();
    emit(NoteLoaded(allNotes));
  }

  void filterNotes(String query) {
    final lowerQuery = query.toLowerCase();

    if (lowerQuery.isEmpty) {
      emit(NoteLoaded(allNotes));
    } else {
      final filtered = allNotes.where((note) {
        final title = note.title.toLowerCase();
        final subtitle = note.subtitle.toLowerCase();
        return title.contains(lowerQuery) || subtitle.contains(lowerQuery);
      }).toList();

      filtered.sort((a, b) {
        final aTitle = a.title.toLowerCase();
        final bTitle = b.title.toLowerCase();

        final aStarts = aTitle.startsWith(lowerQuery);
        final bStarts = bTitle.startsWith(lowerQuery);

        if (aStarts && !bStarts) return -1;
        if (!aStarts && bStarts) return 1;

        return aTitle.indexOf(lowerQuery).compareTo(bTitle.indexOf(lowerQuery));
      });

      emit(NoteLoaded(filtered));
    }
  }
}

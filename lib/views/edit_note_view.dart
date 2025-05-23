import 'package:flutter/cupertino.dart';
import 'package:note/views/widgets/edit_note_view_body.dart';

import '../models/note_model.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return  EditNoteViewBody(note: note,);
  }
}

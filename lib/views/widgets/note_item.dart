import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note/views/edit_note_view.dart';

import '../../cubits/note_cubit/note_cubit.dart';
import '../../models/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  EditNoteView(note: note,),
          ),);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 10),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                note.title,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 16),
                child: Text(
                  note.subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black.withValues(alpha: 0.5),
                  ),
                ),
              ),
              trailing: Transform.translate(
                offset: Offset(10, -40),
                child: IconButton(
                  onPressed: () {
                    note.delete();
                    BlocProvider.of<NoteCubit>(context).fetchNotes();
                  },
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: TextStyle(color: Colors.black.withValues(alpha: 0.5)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

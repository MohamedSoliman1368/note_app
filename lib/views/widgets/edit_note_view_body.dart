import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/note_cubit/note_cubit.dart';
import '../../models/note_model.dart';
import 'custom_app_bar.dart';
import 'custom_text_form_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
   String? title , subtitle;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
          const SizedBox(height: 50),
            CustomAppBar(title: 'Edit Note', icon: Icons.check,onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subtitle = subtitle ?? widget.note.subtitle;
              BlocProvider.of<NoteCubit>(context).fetchNotes();
              widget.note.save();
              Navigator.pop(context);
            }),
           const SizedBox(height: 30),
            CustomTextFormField(
              onChanged: (value) {
                title = value;
              },
              hintText: widget.note.title,),
           const SizedBox(height: 20),
            CustomTextFormField(
              onChanged: (value) {
                subtitle = value;
              },
              hintText: widget.note.subtitle, maxLines: 5,),
          ],
        ),
      ),
    );
  }
}

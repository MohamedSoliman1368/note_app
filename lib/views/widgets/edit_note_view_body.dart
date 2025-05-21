import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/note_cubit/note_cubit.dart';
import '../../models/note_model.dart';
import 'custom_app_bar.dart';
import 'custom_text_form_field.dart';
import 'edit_note_color.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, subtitle;
  late TextEditingController titleController;
  late TextEditingController subtitleController;
  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    subtitleController = TextEditingController(text: widget.note.subtitle);
  }

  @override
  void dispose() {
    titleController.dispose();
    subtitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 50),
            CustomAppBar(
              title: 'Edit Note',
              icon: Icons.check,
              onPressed: () {
                widget.note.title =
                    titleController.text.trim().isEmpty
                        ? widget.note.title
                        : titleController.text.trim();

                widget.note.subtitle =
                    subtitleController.text.trim().isEmpty
                        ? widget.note.subtitle
                        : subtitleController.text.trim();
                BlocProvider.of<NoteCubit>(context).fetchNotes();
                widget.note.save();
                Navigator.pop(context);
              },
            ),
            const SizedBox(height: 30),
            CustomTextFormField(
              textEditingController: titleController,
              onChanged: (value) {
                title = value;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              textEditingController: subtitleController,
              onChanged: (value) {
                subtitle = value;
              },
              maxLines: 15,
            ),
            const SizedBox(height: 30),
            EditNoteColorsList(note: widget.note),
          ],
        ),
      ),
    );
  }
}

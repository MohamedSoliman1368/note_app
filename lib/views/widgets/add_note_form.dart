import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../cubits/cubit_add_note/add_note_cubit.dart';
import '../../cubits/cubit_add_note/add_note_state.dart';
import '../../models/note_model.dart';
import 'color_item.dart';
import 'custom_button.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? title, subtitle;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFormField(
            hintText: 'Content',
            maxLines: 5,
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(height: 20),
          ColorsList(),
          const SizedBox(height: 30),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedDate = DateFormat('dd/MM/yyyy').format(currentDate);
                    var noteModel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formattedDate,
                        color: Colors.blue.toARGB32());
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}



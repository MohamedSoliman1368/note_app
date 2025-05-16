import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/views/widgets/add_note_bottom_sheet.dart';
import 'package:note/views/widgets/notes_view_body.dart';
import '../constants.dart';
import '../cubits/cubit_add_note/add_note_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) {
            return BlocProvider(
              create: (context) => AddNoteCubit(),
              child: const AddNoteBottomSheet(),
            );
          },
          shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor:kPrimaryColor,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
      body: const NotesViewBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note/views/widgets/custom_icon.dart';

import '../../cubits/note_cubit/note_cubit.dart';
import 'custom_app_bar.dart';
import 'custom_search_text_field.dart';
import 'note_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  bool isSearching = false;
  late TextEditingController searchController;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NoteCubit>(context).fetchNotes();
    searchController = TextEditingController();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 50),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Notes',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 16),
          CustomSearchTextField(searchController: searchController),
          const SizedBox(height: 16),
          const Expanded(child: NoteListView()),
        ],
      ),
    );
  }
}

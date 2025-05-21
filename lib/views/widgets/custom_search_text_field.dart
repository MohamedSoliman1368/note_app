import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/note_cubit/note_cubit.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        BlocProvider.of<NoteCubit>(context).filterNotes(value);
      },
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        hintText: 'Search notes...',
        hintStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(Icons.search, color: Colors.grey),
        suffixIcon: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            searchController.clear();
            BlocProvider.of<NoteCubit>(context).filterNotes('');
          },
        ),
        filled: true,
        fillColor: Colors.grey.shade200,
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
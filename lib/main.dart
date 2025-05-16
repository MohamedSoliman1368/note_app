import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/constants.dart';
import 'package:note/simple_bloc_observer.dart';
import 'package:note/views/home_view.dart';
import 'models/note_model.dart';

void main()async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNoteBox);
  runApp(const NoteApp());
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily:'Poppins',
        brightness: Brightness.dark,
      ),
      home: const HomeView(),

    );
  }
}

import 'package:flutter/material.dart';
import 'package:note/views/home_view.dart';

void main() {
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

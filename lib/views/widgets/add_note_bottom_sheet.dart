import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../cubits/cubit_add_note/add_note_cubit.dart';
import '../../cubits/cubit_add_note/add_note_state.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('Failed ${state.errMessage}');
          }
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: SingleChildScrollView(child: AddNoteForm()),
          );
        },
      ),
    );
  }
}

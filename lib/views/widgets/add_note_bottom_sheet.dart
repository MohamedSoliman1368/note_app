import 'package:flutter/cupertino.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return AddNoteForm();
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? title ,subtitle ;
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              CustomTextField(hintText: 'Title',onSaved: (value){
                title = value;
              },),
              const SizedBox(height: 20),
              CustomTextField(hintText: 'Content',maxLines: 5,onSaved: (value){
                subtitle = value;
              }),
              const SizedBox(height: 30),
              CustomButton(
                onTap: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                  }else {
                    autoValidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

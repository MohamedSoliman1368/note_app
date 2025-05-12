import 'package:flutter/material.dart';
import '../../constants.dart';
class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hintText, this.maxLines=1, this.onSaved});
  final String? hintText;
  final int? maxLines;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      onSaved: onSaved,
      maxLines: maxLines,
      cursorColor: kPrimaryColor,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:TextStyle(color:kPrimaryColor),
        border: buildBorder(),
        focusedBorder:buildBorder(kPrimaryColor),
        enabledBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10),),
        borderSide:BorderSide(color: color ?? Colors.white),
      );
  }
}
